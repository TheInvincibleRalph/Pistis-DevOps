#!/bin/bash

# This script undoes the renaming of files by stripping the prefix and year added to the file names.
# It takes the directory and the same prefix used before as arguments.

dir=${1:-.}
prefix=$2

if [ -z "$prefix" ]; then

    echo "You must provide the same prefix that was used to rename the files."
    exit 1
fi

for file in $dir/${prefix}_*_[0-9][0-9][0-9][0-9]; do
    if [ -f "$file" ]; then
        # Extract the original file name by removing the prefix and the last 5 characters (_YYYY)

        originalname=$(basename "$file")
        originalname=${originalname#${prefix}_} # Remove the prefix
        originalname=${originalname%_*}         # Remove the trailling _YYYY

        # Rename the file back to its original name
        mv "$file" "$dir/originalname"

        # Check if the rename was successful and give feedback
        if [ $? -eq 0 ]; then
            echo "File $file renamed back to $originalname successfully"
        else
            echo "An error occurred while renaming $file"
        fi
    fi
done
