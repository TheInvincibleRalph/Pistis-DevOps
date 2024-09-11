#!/bin/bash

# Archive Script
# This script creates a compressed archive of a directory

dir=$1

if [ ! -d $dir ]; then
    echo "$dir is not a valid directory."
    exit 1
fi

if [ -z $dir ]; then
    echo "No directory provided. Usage: $0 <directory>"
    exit 1
fi

if [ -z $(ls -A $dir) ]; then
    echo "$dir is empty or does not contain any file."
    exit 1
fi

timestamp=$(date +"%Y%m%d_%H%M%S")
archive_name="$(basename $dir)_$timestamp.tar.gz"

tar -czf "$archive_name" -C "$dir" .
echo "Backup of $dir completed!"
