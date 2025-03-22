#!/bin/bash

# Ask user if they want full uninstall or just containers
echo -n "Do you want a full uninstall (removing all VulScan data) or just remove a specific VulScan appliance? (full/app): "
read -r UNINSTALL_TYPE

# If user wants a full uninstall
if [[ "$UNINSTALL_TYPE" =~ ^(full|Full)$ ]]; then
    echo "Starting full uninstall..."
	echo "If there are tasks running, they will be killed and data will be lost..."
	echo -n "Please confirm you want to proceed (y/n): "
	read -r FULL_UNINSTALL
	if [[ "$FULL_UNINSTALL" =~ ^(y|Y)$ ]]; then
		echo "Stopping containers ..."
		CONTAINERS=$(docker ps --format "{{.ID}} {{.Names}} {{.Image}}")
		CONTAINERS_TO_REMOVE=$(echo "$CONTAINERS" | grep -i "vulscan/easyinstall" | awk '{print $1}')
		if [ -z "$CONTAINERS_TO_REMOVE" ]; then
			echo "No containers found with the image 'vulscan/easyinstall'."
			return
		fi
		echo "$CONTAINERS_TO_REMOVE" | xargs docker stop
		echo "$CONTAINERS_TO_REMOVE" | xargs docker rm
		echo "Containers with 'vulscan/easyinstall' image have been stopped and removed."
		echo "Removing Docker image..."
		IMAGES=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep -i "vulscan/easyinstall")
		if [ -z "$IMAGES" ]; then
			echo "No images found containing 'vulscan/easyinstall'."
			return
		fi
		# Remove the image(s)
		echo "$IMAGES" | xargs docker rmi -f
		echo "Docker image(s) containing 'vulscan/easyinstall' have been removed."
		crontab -l 2>/dev/null | grep -v "/opt/vulscanagent-data" | crontab -
		rm -rf /opt/vulscanagent-data
		echo "Full uninstall completed."
		exit 0
	else
		echo "Full uninstall cancelled."
		exit 0
    fi
fi

while true; do
    CONTAINERS=$(docker ps --format "{{.ID}} {{.Names}}")
    if [ -z "$CONTAINERS" ]; then
        echo "No running Docker containers found."
        exit 0
    fi

    echo "Running VulScan Appliance Containers:"
    echo "--------------------------"
    docker ps --format "Name: {{.Names}} | Image: {{.Image}}"

    echo -n "Enter the ID of the VulScan Appliance you want to uninstall: "
    read -r CONTAINER_SELECTION

    echo "Checking tasks status in container: $CONTAINER_SELECTION..."
    TASK_OUTPUT=$(docker exec "$CONTAINER_SELECTION" bash -c "/opt/vulscanagent/scripts/get-tasks" 2>/dev/null)
    
    # Check if the task output is empty or contains only "Done" tasks
    if [ -z "$TASK_OUTPUT" ] || ! echo "$TASK_OUTPUT" | grep -qv "Done"; then
        echo "No tasks are currently running or all tasks are done. Proceeding with uninstalling."
        
        echo "Stopping container: $CONTAINER_SELECTION..."
        docker stop "$CONTAINER_SELECTION"

        echo "Pruning container: $CONTAINER_SELECTION..."
        docker container rm "$CONTAINER_SELECTION"

        echo "Checking for cron jobs related to container: $CONTAINER_SELECTION..."
        CRON_JOBS=$(crontab -l 2>/dev/null | grep "$CONTAINER_SELECTION")

        if [ -n "$CRON_JOBS" ]; then
            echo "Found the following cron jobs related to $CONTAINER_SELECTION:"
            echo "$CRON_JOBS"

            echo "Removing cron jobs related to $CONTAINER_SELECTION..."
            crontab -l 2>/dev/null | grep -v "$CONTAINER_SELECTION" | crontab -
            echo "Cron jobs for $CONTAINER_SELECTION have been removed."
        else
            echo "No cron jobs found for $CONTAINER_SELECTION."
        fi

        echo "VulScan Appliance $CONTAINER_SELECTION has been uninstalled."

    else
        echo "There are currently running tasks. Are you sure you want to uninstall the VulScan Appliance?"
		echo -n "Data for running tasks will be lost. Please confirm (y/n): "
        read -r CONFIRMATION
        
        if [[ "$CONFIRMATION" =~ ^(y|Y)$ ]]; then
            echo "Stopping container: $CONTAINER_SELECTION..."
            docker stop "$CONTAINER_SELECTION"

            echo "Pruning container: $CONTAINER_SELECTION..."
            docker container rm "$CONTAINER_SELECTION"

            echo "Checking for cron jobs related to container: $CONTAINER_SELECTION..."
            CRON_JOBS=$(crontab -l 2>/dev/null | grep "$CONTAINER_SELECTION")

            if [ -n "$CRON_JOBS" ]; then
                echo "Found the following cron jobs related to $CONTAINER_SELECTION:"
                echo "$CRON_JOBS"

                echo "Removing cron jobs related to $CONTAINER_SELECTION..."
                crontab -l 2>/dev/null | grep -v "$CONTAINER_SELECTION" | crontab -
                echo "Cron jobs for $CONTAINER_SELECTION have been removed."
            else
                echo "No cron jobs found for $CONTAINER_SELECTION."
            fi

            echo "VulScan Appliance $CONTAINER_SELECTION has been uninstalled."

        else
            echo "VulScan Appliance $CONTAINER_SELECTION has been skipped."
        fi
    fi

    echo -n "Would you like to uninstall another VulScan Appliance? (y/n): "
    read -r CONTINUE_CHOICE
    if [[ "$CONTINUE_CHOICE" =~ ^(no|n)$ ]]; then
        echo "Exiting. Goodbye!"
        exit 0
    fi
done
