#!/bin/bash

# This script renames all files in a directory to a new name by adding a prefix to the file name.
# It takes the directory path and prefix as arguments. 
# The script defaults to the current directory if no argument is passed.

dir=${1:-.}
prefix=$2

for file in $dir/*; do
    if [ -f "$file" ]; then
    newfile="{$prefix}_$file"
        mv "$file" "$dir/$newfile"
    fi

    if [ $? -eq 0 ]; then
        echo "File $file renamed to $newfile successfully"
    else
        echo "An error occurred while renaming $file"
    fi
done