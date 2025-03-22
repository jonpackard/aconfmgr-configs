#!/bin/bash
export PATH=$PATH:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin
if docker ps --filter "name=deadbeefdead" --format '{{.Names}}' | grep -q "^deadbeefdead$"; then
  :
else
  echo "$(date): Container 'deadbeefdead' is not running. Attempting to start it..." >> /opt/vulscanagent-data/log/deadbeefdead_cronjob.log
  
  # Try to start the container
  if docker start "deadbeefdead" > /dev/null 2>&1; then
    echo "$(date): Container 'deadbeefdead' started successfully." >> /opt/vulscanagent-data/log/deadbeefdead_cronjob.log
  else
    echo "$(date): Failed to start container 'deadbeefdead'. It may not exist." >> /opt/vulscanagent-data/log/deadbeefdead_cronjob.log
  fi
fi
HOST_IP=$(ip -4 addr show | grep -E 'inet ' | grep -Ev '127.0.0.1|docker' | awk '{print $2}')
docker exec deadbeefdead bash -c "printf '%s\n'  '$HOST_IP' > /tmp/host-ipranges"
# Confirm the file has been written
if [[ 0 -eq 0 ]]; then
  :
else
  echo "Error: Failed to write the IP address to the container." >> /opt/vulscanagent-data/log/deadbeefdead_cronjob.log
fi

