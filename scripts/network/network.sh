#!/bin/bash

#Network Monitoring Script
# This script will iterate over a predefined list of server addresses or IPs.
# It will then attempt to ping each server and log the results to a file.
# If a server does not respond, it will log a failure message.

# List of servers
SERVERS=("127.0.0.1" "google.com" "bing.com")
LOGFILE="network.log"

for SERVER in "${SERVERS[@]}"; do
    # Get the current date and time
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

    # Ping the server (sending 1 packet and timeout after 5 seconds)
    if ping -c 1 -W 5 $SERVER &>/dev/null; then
        # If ping is successful, log a success message
        echo "$TIMESTAMP - $SERVER is reachable." >>$LOGFILE
    else
        # If ping fails, log a failure message
        echo "$TIMESTAMP - $SERVER is unreachable!" >>$LOGFILE
    fi
done
