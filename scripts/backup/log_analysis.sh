#!/bin/bash

LOG_FILE=$1

# Log Analysis Script
# This script analyzes system log files for errors, warnings, and other key information

if [ -z "$LOG_FILE" ]; then
    echo "Usage: ./log_analysis.sh <log path>" # Prints a message to the user on how to use the script correctly
    exit 1
fi

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file $LOG_FILE not found!"
    exit 1
fi

function search_keyword() {
    local keywords=$1
    echo "Searching for '$keywords' in the logs..."

    # Find and count occurrences
    count=$(grep -i "$keywords" "$LOG_FILE" | wc -l)
    echo "Found $count occurences of '$keywords'"

    # Check if any occurrences were found
    if [ "$count" -gt 0 ]; then
        echo "Listing the lines containing '$keywords:'"
        grep -i "$keywords" "$LOG_FILE"
        echo "________________________"
    else
        echo "No occurences of '$keywords' found."
    fi

}

search_keyword "error"
search_keyword "warning"
