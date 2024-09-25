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

check_memory() {
    MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    echo "Memory Usage: $MEMORY_USAGE%"
    if (($(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l))); then
        send_alert "High Memory usage detected: ${MEMORY_USAGE}%"
    fi
}

check_disk() {
    DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')
    echo "Disk Usage: $DISK_USAGE%"
    if ((DISK_USAGE > DISK_THRESHOLD)); then
        send_alert "High Disk usage detected: ${DISK_USAGE}%"
    fi
}

check_network() {
    RX_PREV=$(cat /sys/class/net/eth0/statistics/rx_bytes) # Reads the received bytes count from the network interface eth0
    TX_PREV=$(cat /sys/class/net/eth0/statistics/tx_bytes) # Reads the transmitted bytes count from the network interface eth0
    sleep 1
    RX_NEXT=$(cat /sys/class/net/eth0/statistics/rx_bytes)
    TX_NEXT=$(cat /sys/class/net/eth0/statistics/tx_bytes)

    RX_RATE=$(((RX_NEXT - RX_PREV) / 1024)) # in KB/s
    TX_RATE=$(((TX_NEXT - TX_PREV) / 1024)) # in KB/s

    echo "Network RX: $RX_RATE KB/s, TX: $TX_RATE KB/s"

    if ((RX_RATE > NETWORK_THRESHOLD || TX_RATE > NETWORK_THRESHOLD)); then
        send_alert "High Network activity detected: RX ${RX_RATE} KB/s, TX ${TX_RATE} KB/s"
    fi

}

while true; do # runs an inifinite loop to continously monitor the system resources
    echo "Checking system resources..."
    check_cpu
    check_memory
    check_disk
    check_network
    echo "----------------------------------"
    sleep 10
done
