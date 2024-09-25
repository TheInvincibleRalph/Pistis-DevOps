#!/bin/bash

# Thressholds
CPU-THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80
NETWORK_THRESHOLD=1000 # Network bandwidth threshold in KB/s

Email settings
ALERT_EMAIL="adesegunraphaeladeoye@gmail.com"
SUBJECT="System Resource Alert"
MAIL_CMD="mail -s" # Command to send mail. Requires mailx to be configured

# Function to send alert
send_alert() {
    local message=$1
    echo "$message" | $MAIL_CMD "$SUBJECT" "$ALERT_EMAIL"
}

# Monitor CPU Usage
check_cpu() {
    CPU_USAGE=$(top -bn1 | grep "Cpus(s)" | sed "s/.*, *\([0-9.]%* id.*/\1/" | awk '{print 100 - $1}')
    echo "CPU Usage: $CPU_USAGE%"
    if (($(echo "echo "CPU_USAGE" > $CPU_THRESHOLD" | bc -l))); then
        send_alert "High CPU usage detected: ${CPU_USAGE}%"
    fi
}
