#!/usr/bin/env bash
# Copyright 2024, Kaseya Inc
# All rights reserved.
#
# This script may not be redistributed without express written consent from
# Kaseya Inc.
#
# Last Modified: January 24, 2025
# Version 1.0.1

# System requirement: minimum of 3.5GB of free memory (4GB+ preferred)

if [[ $(free -m | awk '/Mem/ {print $7}') -lt 4000 ]]; then
	echo "Your system does not have the recommended 4GB of free allocated memory. Please refer to the Help Center for minimum memory requirements: https://www2.rapidfiretools.com/vs/help/vulscan/vulscan-easy-install.htm"
	exit
fi

# System requirement: minimum of 25GB disk space
# Get the size and available space of the / volume in GB
size=$(df -k / | awk 'NR==2{print $2/1024/1024}')
available=$(df -k / | awk 'NR==2{print $4/1024/1024}')

if (($(awk -v size="$size" 'BEGIN {print (size > 25)}'))) && (($(awk -v available="$available" 'BEGIN {print (available > 25)}'))); then
	# Continue with the script
	echo "Disk space meets the minimum requirements for VulScan. Continuing with the install..."
else
	# Exit the script and show an error message
	echo 'Your system does not have the recommended disk space requirements (at least 25GB free). Please refer to the Help Center for minimum system requirements: https://www2.rapidfiretools.com/vs/help/vulscan/vulscan-easy-install.htm'
	echo 'Please verify that your "/" mount has 25GB+ allocated.'
	echo 'In some cases, your disk space may be 25GB+, but the amount of disk space allocated to "/"'
	echo 'is less than 25GB. You can use the "df -h" command to confirm this.'
	exit
fi

# Check to make sure the user is logged in as root.
if [[ $EUID -ne 0 ]]; then
	echo
	echo "This script must be run as root. Please refer to the Help Center or installation instructions for additional assistance. (Error code: 0x01)"
	exit 1
fi

# Check if the 'crontab' command exists using 'which'
if which crontab >/dev/null 2>&1; then
    echo "Crontab is installed on your system, proceeding."
else
    echo "Crontab is not installed on your system, exiting."
    echo "To install it, use the appropriate package manager for your distribution."
    exit 1
fi

#function to check if Docker is installed
check_docker_installed() {
    if command -v docker &> /dev/null; then
        echo "Docker is already installed on this system."
        return 0
    else
        echo "Docker is NOT installed on this system."
        return 1
    fi
}

# Function to install Docker on Ubuntu
install_docker_ubuntu() {
    echo "Installing Docker on Ubuntu..."
    sudo apt-get update
    sudo apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    sudo mkdir -m 0755 -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo systemctl start docker.service
    sudo systemctl enable docker.service
}

# Function to install Docker on RHEL
install_docker_rhel() {
    echo "Installing Docker on RHEL..."
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum install -y docker-ce docker-ce-cli containerd.io
    sudo systemctl start docker
    sudo systemctl enable docker
}

# Function to install Docker on Raspberry Pi OS
install_docker_raspberry_pi() {
    echo "Installing Docker on Raspberry Pi OS..."
    curl -sSL https://get.docker.com | sh
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
    sudo systemctl start docker
}

# Function to install Docker on Kali Linux
install_docker_kali() {
    echo "Installing Docker on Kali Linux..."
    sudo apt update
    sudo apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo systemctl start docker
    sudo systemctl enable docker
}

# Detect the OS and call the appropriate installation function
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        ubuntu)
            check_docker_installed || install_docker_ubuntu
            ;;
        rhel|centos)
            check_docker_installed || install_docker_rhel
            ;;
        raspbian|raspios)
            check_docker_installed || install_docker_raspberry_pi
            ;;
        kali)
            check_docker_installed || install_docker_kali
            ;;
        *)
            if check_docker_installed; then
				echo "Docker is installed. Proceeding..."
			else
				echo "Exiting script because Docker is not installed."
				exit 1
			fi
            ;;
    esac
else
    echo "Cannot determine the operating system." 
    if check_docker_installed; then
        echo "Docker is installed. Proceeding..."
    else
        echo "Exiting script because Docker is not installed."
        exit 1
    fi
fi

# Verify Docker installation
echo "Verifying Docker installation..."
docker --version && echo "Docker installed successfully." || echo "Docker installation failed."


# Set variables for Docker image and script URLs

# Function to pull Docker image
pull_docker_image() {
    echo "Pulling Docker image: $VULSCAN_IMAGE"
    if docker pull "$VULSCAN_IMAGE"; then
        echo "Docker image pulled successfully."
    else
        echo "Failed to pull Docker image."
        exit 1
    fi
}

# Function to validate Docker image
validate_docker_image() {
    echo "Validating Docker image..."
    if docker inspect "$VULSCAN_IMAGE" &>/dev/null; then
        echo "Docker image is valid."
    else
        echo "Docker image is not valid."
        exit 1
    fi
}

#creating /opt/vulscan-data folder on host-ipranges
VULSCAN_DIR="/opt/vulscanagent-data"
sudo mkdir -p /opt/vulscanagent-data
sudo mkdir -p /opt/vulscanagent-data/cronjobs
sudo mkdir -p /opt/vulscanagent-data/scripts
sudo mkdir -p /opt/vulscanagent-data/log

# Map parameter to corresponding directory
if [[ $# -eq 0 ]]; then
    export VULSCAN_ENV="download/"
	export VULSCAN_IMAGE="public.ecr.aws/q7z4o7o1/vulscan/easyinstall-public:latest"
	echo "$VULSCAN_ENV" > $VULSCAN_DIR/log/vulscan_env
	echo "$VULSCAN_IMAGE" > $VULSCAN_DIR/log/vulscan_image
	echo "Using production environment..."
else
    case $1 in
        --alpha)
            export VULSCAN_ENV="alpha/"
			export VULSCAN_IMAGE="public.ecr.aws/q7z4o7o1/vulscan/easyinstall-public:alpha"
			echo "$VULSCAN_ENV" > $VULSCAN_DIR/log/vulscan_env
			echo "$VULSCAN_IMAGE" > $VULSCAN_DIR/log/vulscan_image
			echo "Using alpha environment..."
            ;;
        --beta)
            export VULSCAN_ENV="beta/"
			export VULSCAN_IMAGE="public.ecr.aws/q7z4o7o1/vulscan/easyinstall-public:beta"
			echo "$VULSCAN_ENV" > $VULSCAN_DIR/log/vulscan_env
			echo "$VULSCAN_IMAGE" > $VULSCAN_DIR/log/vulscan_image
			echo "Using beta environment..."
            ;;
        --internal)
            export VULSCAN_ENV="internal/"
			export VULSCAN_IMAGE="public.ecr.aws/q7z4o7o1/vulscan/easyinstall-public:internal"
			echo "$VULSCAN_ENV" > $VULSCAN_DIR/log/vulscan_env
			echo "$VULSCAN_IMAGE" > $VULSCAN_DIR/log/vulscan_image
			echo "Using internal environment..."
            ;;
        *)
            echo "Invalid environment selected. Use --alpha, --beta, --internal, or no parameter for production."
            exit 1
            ;;
    esac
fi

# Construct URLs dynamically
SCRIPT_URLS=(
    "https://download.rapidfiretools.com/${VULSCAN_ENV}vulscan_easy_install_updater.sh"
    "https://download.rapidfiretools.com/${VULSCAN_ENV}vulscan_easy_install_uninstall.sh"
    "https://download.rapidfiretools.com/${VULSCAN_ENV}vulscan_easy_install.sh"
)


# Function to download scripts
download_scripts() {
    # Ensure /root/scripts directory exists
    SCRIPT_DIR="${VULSCAN_DIR}/scripts"

    echo "Downloading scripts..."
    for url in "${SCRIPT_URLS[@]}"; do
        script_name=$(basename "$url")
        target_path="$SCRIPT_DIR/$script_name"
        
        # Download the script
        if curl -o "$target_path" -fsSL "$url"; then
            echo "Downloaded $script_name to $SCRIPT_DIR"
            # Make the script executable
            sudo chmod +x "$target_path"
        else
            echo "Failed to download $script_name from $url"
        fi
    done
}

# execute docker pull and validate and scripts
pull_docker_image
validate_docker_image
download_scripts
echo "Docker Image and scripts successfully downloaded."

#validate_license_key() {
#    # Regex pattern to match IVS1-ABCD12 format
#    local license_key_regex="^IVS1-[A-Z]{4}[0-9]{2}$"
#    if [[ $1 =~ $license_key_regex ]]; then
#        return 0 # Valid format
#    else
#        return 1 # Invalid format
#    fi
#}


# Prompt user for the license key
#while true; do
#    read -p "Enter your license key (format IVS1-ABCD12): " user_input
#    if validate_license_key "$user_input"; then
#        DA_LICENSE_KEY="$user_input"
#        echo "License key accepted: $DA_LICENSE_KEY"
#        break
#    else
#        echo "Invalid license key format. Please try again."
#    fi
#done

while true; do
  read -p "Enter your VulScan appliance ID: " DA_LICENSE_KEY

  if [[ -z "$DA_LICENSE_KEY" ]]; then
    echo "Error: Container name cannot be empty. Please try again."
    continue
  fi

  # Check if a container with the name already exists
  EXISTING_CONTAINER=$(docker ps -a --filter "name=$DA_LICENSE_KEY" --format '{{.Names}}')

  if [[ -n "$EXISTING_CONTAINER" ]]; then
    echo "Error: You've already used ID $DA_LICENSE_KEY. Please try again."
  else
    echo "No container with the name '$DA_LICENSE_KEY' found. You can proceed with creating it."
    break
  fi
done

# Confirm with the user to install the Docker image
read -p "Do you want to install and run the Docker image? (y/n): " confirm

DEFAULT_PORT=9392
if lsof -i :$DEFAULT_PORT > /dev/null 2>&1; then
  echo "Port $DEFAULT_PORT is already in use."
  while true; do
    read -p "Enter a new port number. Ensure the selected port is available and not being used by another service. For example, you can select a port within the range of 9400-9500: " NEW_PORT
    if [[ ! "$NEW_PORT" =~ ^[0-9]+$ ]]; then
      echo "Invalid input. Please enter a numeric port number."
    elif lsof -i :$NEW_PORT > /dev/null 2>&1; then
      echo "Port $NEW_PORT is also in use. Try another."
    else
      PORT=$NEW_PORT
      break
    fi
  done
else
  PORT=$DEFAULT_PORT
fi


if [[ "$confirm" =~ ^[Yy]$ ]]; then
    # Run the docker, passing license key as env variables 
	ENV_PASSED="${VULSCAN_ENV%/}"
	docker run -d -e DA_LICENSE_KEY="$DA_LICENSE_KEY" -p $PORT:9392 -e SYNCSKIP=true -e VULSCAN_ENV="$ENV_PASSED" --hostname "$DA_LICENSE_KEY" --name "$DA_LICENSE_KEY" "$VULSCAN_IMAGE"	
else
    echo "Docker installation failed."
fi

# Check if the cron job already exists
UPDATE_CRON_JOB="@weekly /bin/bash ${VULSCAN_DIR}/scripts/vulscan_easy_install_updater.sh"

# Function to create the cron job
create_cron_job() {
    (crontab -l 2>/dev/null; echo "$UPDATE_CRON_JOB") | crontab -
    echo "Cron job created to check Docker image updates every week."
}

# Make the script executable
chmod +x $VULSCAN_DIR/scripts/vulscan_easy_install_updater.sh

# Create the cron job if not already set
(crontab -l | grep -q "$UPDATE_CRON_JOB") || create_cron_job


echo "Docker image update check cron job is set up."
sleep 2

echo "Create cron job for the container's feed sync ..."
docker exec -it "$DA_LICENSE_KEY" bash -c "\
  echo '0 1 * * * /opt/vulscanagent/scripts/feed-update > /tmp/feed-update.log 2>&1' > /etc/cron.d/greenbone-sync && \
  chmod 0644 /etc/cron.d/greenbone-sync && \
  crontab /etc/cron.d/greenbone-sync && \
  service cron start"

echo "Cron job created"

echo "Create cron job to start container at system reboot and to send host IP to container"
CRON_JOB="${VULSCAN_DIR}/cronjobs/${DA_LICENSE_KEY}_cronjob.sh"
CRON_LOG="${VULSCAN_DIR}/log/${DA_LICENSE_KEY}_cronjob.log"
cat <<EOL > $CRON_JOB
#!/bin/bash
export PATH=\$PATH:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin
if docker ps --filter "name=$DA_LICENSE_KEY" --format '{{.Names}}' | grep -q "^$DA_LICENSE_KEY\$"; then
  :
else
  echo "\$(date): Container '$DA_LICENSE_KEY' is not running. Attempting to start it..." >> $CRON_LOG
  
  # Try to start the container
  if docker start "$DA_LICENSE_KEY" > /dev/null 2>&1; then
    echo "\$(date): Container '$DA_LICENSE_KEY' started successfully." >> $CRON_LOG
  else
    echo "\$(date): Failed to start container '$DA_LICENSE_KEY'. It may not exist." >> $CRON_LOG
  fi
fi
HOST_IP=\$(ip -4 addr show | grep -E 'inet ' | grep -Ev '127.0.0.1|docker' | awk '{print \$2}')
docker exec $DA_LICENSE_KEY bash -c "printf '%s\\n'  '\$HOST_IP' > /tmp/host-ipranges"
# Confirm the file has been written
if [[ $? -eq 0 ]]; then
  :
else
  echo "Error: Failed to write the IP address to the container." >> $CRON_LOG
fi

EOL

chmod +x $CRON_JOB

CRON_MINUTE="* * * * * /bin/bash $CRON_JOB"

CRONTAB_EXISTS=$(crontab -l 2>/dev/null | grep -F "$CRON_JOB" | grep -F "$DA_LICENSE_KEY")

if [[ -z "$CRONTAB_EXISTS" ]]; then
  (crontab -l 2>/dev/null; echo "$CRON_MINUTE") | crontab -
  echo "Cron job added to run every minute."
else
  echo "Cron job already exists. No changes made."
fi

echo "Install script completed!"

# End of script
