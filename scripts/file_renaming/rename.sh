#!/bin/bash

# This script renames all files in a directory to a new name by adding a prefix to the file name.
# It takes the directory path and prefix as arguments.
# The script defaults to the current directory if no argument is passed.

dir=${1:-.}
prefix=$2

for file in $dir/*; do
    if [ -f "$file" ]; then
        # Extract the file name and create a new name with the prefix and the current year
        newfile="$prefix_(basename "$file")_$(date +%Y)"
        mv "$file" "$dir/$newfile"

 # Check if the rename was successful and give feedback
        if [ $? -eq 0 ]; then
            echo "File $file renamed to $newfile successfully"
        else
            echo "An error occurred while renaming $file"
        fi

    fi
done
