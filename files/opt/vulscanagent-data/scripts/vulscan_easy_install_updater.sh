#!/usr/bin/env bash

VULSCAN_DIR="/opt/vulscanagent-data"
LOG_FILE="${VULSCAN_DIR}/log/updater.log"
container_names=$(docker ps --format '{{.Names}}')
SOURCE_DIR="/opt/vulscanagent"
DOCKER_IMAGE=$(cat $VULSCAN_DIR/log/vulscan_image)
VULSCAN_ENV=$(cat $VULSCAN_DIR/log/vulscan_env)
LOCAL_DIR="/tmp/vulscanagent_backup"
CHECK_UPDATE_FILE="/opt/vulscanagent/update_check"
SCRIPTS=(
    "${VULSCAN_DIR}/scripts/vulscan_easy_install_updater.sh"
    "${VULSCAN_DIR}/scripts/vulscan_easy_install_uninstall.sh"
    "${VULSCAN_DIR}/scripts/vulscan_easy_install.sh"
)
REMOTE_URLS=(
    "https://download.rapidfiretools.com/${VULSCAN_ENV}vulscan_easy_install_updater.sh"
    "https://download.rapidfiretools.com/${VULSCAN_ENV}vulscan_easy_install_uninstall.sh"
    "https://download.rapidfiretools.com/${VULSCAN_ENV}vulscan_easy_install.sh"
)

#script updater
for i in "${!SCRIPTS[@]}"; do
    LOCAL_SCRIPT="${SCRIPTS[$i]}"
    REMOTE_SCRIPT_URL="${REMOTE_URLS[$i]}"
    TEMP_REMOTE_SCRIPT="/tmp/$(basename "$LOCAL_SCRIPT")_temp.sh"

    # Check if the local script exists
    if [ ! -f "$LOCAL_SCRIPT" ]; then
        echo "Local script not found at $LOCAL_SCRIPT. Downloading the remote script." >> "$LOG_FILE"
        curl -s -o "$LOCAL_SCRIPT" "$REMOTE_SCRIPT_URL"
        if [ $? -eq 0 ]; then
            echo "Remote script downloaded and saved to $LOCAL_SCRIPT." >> "$LOG_FILE"
        else
            echo "Failed to download the remote script. Please check the URL or network connection." >> "$LOG_FILE"
            continue
        fi
        continue
    fi

    # Download the remote script to a temporary location
    curl -s -o "$TEMP_REMOTE_SCRIPT" "$REMOTE_SCRIPT_URL"
    if [ $? -ne 0 ]; then
        echo "Failed to download the remote script. Please check the URL or network connection." >> "$LOG_FILE"
        continue
    fi

    # Compare the contents of the local and remote scripts
    if cmp -s "$LOCAL_SCRIPT" "$TEMP_REMOTE_SCRIPT"; then
        echo "The local script $LOCAL_SCRIPT and the remote script are identical. No update needed." >> "$LOG_FILE"
    else
        echo "The local script $LOCAL_SCRIPT and the remote script differ. Updating the local script." >> "$LOG_FILE"
        mv "$TEMP_REMOTE_SCRIPT" "$LOCAL_SCRIPT"
        if [ $? -eq 0 ]; then
            echo "Local script $LOCAL_SCRIPT successfully updated with the remote version." >> "$LOG_FILE"
        else
            echo "Failed to update the local script $LOCAL_SCRIPT. Check permissions or disk space." >> "$LOG_FILE"
            rm -f "$TEMP_REMOTE_SCRIPT"
            continue
        fi
    fi

    # Clean up the temporary file if it still exists
    if [ -f "$TEMP_REMOTE_SCRIPT" ]; then
        rm -f "$TEMP_REMOTE_SCRIPT"
    fi

done

#docker image updater
echo "$(date): Checking for updates to Docker image vulscan" >> $LOG_FILE
# Pull the latest image
docker pull $DOCKER_IMAGE

# Get the image ID of the latest image
LATEST_IMAGE_ID=$(docker images -q $DOCKER_IMAGE)
for container in $container_names; do
    # Get the image ID of the image used by the running container
    CURRENT_IMAGE_ID=$(docker inspect -f '{{.Image}}' $container | awk -F':' '{print substr($2,1,12)}')
	UPDATE_VALUE=$(docker exec "$container" cat "$CHECK_UPDATE_FILE" 2>/dev/null)
	if [ "$UPDATE_VALUE" == "true" ]; then
		echo "$(date): Update ok for $container" >> $LOG_FILE
	else
		echo "$(date): No need for update on $container" >> $LOG_FILE
		continue
	fi
    # Compare image IDs to see if there is an update
    #if [ "$CURRENT_IMAGE_ID" != "$LATEST_IMAGE_ID" ]; then #uncomment this line to work as intended
	if [ "$CURRENT_IMAGE_ID" == "$LATEST_IMAGE_ID" ]; then #comment this line to work as intended
        echo "$(date): New update detected for $container. Image ID has changed." >> $LOG_FILE
        echo "$(date): Starting update ..." >> $LOG_FILE
        echo "$(date): Moving existing DA ..." >> $LOG_FILE
        docker cp "$container:$SOURCE_DIR" "$LOCAL_DIR"
        # Check if the copy was successful
        if [ $? -ne 0 ]; then
			echo "$(date): Failed to copy $SOURCE_DIR from $container. Skipping $container." >> $LOG_FILE
            rm -rf $LOCAL_DIR
			continue
        fi
        echo "$(date): Directory copied successfully to $LOCAL_DIR." >> $LOG_FILE
		PORT_MAPPING=$(docker ps --filter "name=$container" --format '{{.Ports}}')
		PORT=$(echo "$PORT_MAPPING" | sed -n 's/.*:\([0-9]\{1,5\}\)-.*/\1/p')
		echo "$(date): Port used by $container is $PORT" >> $LOG_FILE
        echo "$(date): Stopping the container $container..." >> $LOG_FILE
        docker container stop $container
        echo "$(date): Pruning stopped containers..." >> $LOG_FILE
        docker container prune -f
        echo "$(date): Starting a new container from the new image..." >> $LOG_FILE
        NEW_CONTAINER_ID=$(docker run -d -p $PORT:9392 -e REGISTER=false -e SYNCSKIP=true --name $container $DOCKER_IMAGE)
        if [ -z "$NEW_CONTAINER_ID" ]; then
            echo "$(date): Failed to start a new container. Skipping $container." >> $LOG_FILE
            rm -rf $LOCAL_DIR
			continue
        fi
        echo "$(date): New container started with ID $NEW_CONTAINER_ID." >> $LOG_FILE
        echo "$(date): Removing existing VulscanAgent folder ..." >> $LOG_FILE
        docker exec $container rm -rf $SOURCE_DIR
        echo "$(date): Copying VulscanAgent in the new container..." >> $LOG_FILE
        docker cp "$LOCAL_DIR" "$NEW_CONTAINER_ID:$SOURCE_DIR"
        if [ $? -ne 0 ]; then
            echo "$(date): Failed to copy VulscanAgent in the new container. Skipping $container." >> $LOG_FILE
            rm -rf $LOCAL_DIR
			continue
        fi
        echo "$(date): VulscanAgent copied successfully to the new container $container" >> $LOG_FILE
        echo "$(date): Cleaning up after updating $container..." >> $LOG_FILE
        rm -rf $LOCAL_DIR
    else
        echo "$(date): No updates found for $container." >> $LOG_FILE
    fi
done
