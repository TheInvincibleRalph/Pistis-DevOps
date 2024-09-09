#!/bin/bash

LOG_FILE=$1

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file $LOG_FILE not found!"
    exit 1
fi


function search_keyword() {
    local keywords=$@
    echo "Searching for '$keywords' in the logs..."
    count=$(grep -i "$keywords" "$LOG_FILE" | wc -l)
    echo "Found $count occurences of '$keywords'"
}

search_keyword "error" "warning"