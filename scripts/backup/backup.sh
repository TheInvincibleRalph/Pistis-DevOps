#!/bin/bash

# This script copies files from one directoty to a backkup directory

src=$1
dest=$2

if [ -z "$src" ] || [ -z "$dest" ]; then
    echo "Usage: ./backup.sh <source> <destination>" # Prints a message to the user on how to use the script correctly
    exit 1
fi

if [ ! -d "$src" ]; then
    echo "Source directory does not exist"
    exit 1
fi

if [ ! -d "$dest" ]; then
    mkdir -p $dest # Create the backup directory if it does not exist
fi

function backup() {

    for file in $(ls $src); do
        # Check if $file is a directory
        if [ -d "$file" ]; then
            # Avoid copying the directory into itself
            base=$(basename "$file")
            if [ ! -d "$dest/$base" ]; then
                echo "Copying directory $file to $dest"
                cp -r "$file" "$dest"
            else
                echo "Skipping $file as it is already present in the destination"
            fi
        else
            # Copy files
            echo "Copying file $file to $dest"
            cp "$file" "$dest"
        fi
    done
}

# Calls the backup function
backup
