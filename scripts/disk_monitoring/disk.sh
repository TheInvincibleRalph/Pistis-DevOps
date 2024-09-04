#!/bin/bash

# This script will monitor the disk space usage and send an email alert if it exceeds the threshold.

# Set the threshold value
THRESHOLD=80
USAGE=$(df -h  | grep 'mnt/c' | awk '{print $5}' | sed 's/%//g')

if [ $USAGE -gt $THRESHOLD ]; then
    echo "Disk space usage is above $THRESHOLD% on $(hostname)" | mail -s "Disk Space Alert" theinvincibledev@gmail.com
fi


# This script can be run as a cron job to monitor the disk space usage on a regular basis.