Our script is started with the so called *Shebang* statement:

```bash
#!/bin/bash
```
followed by a comment about what the script does:

```bash
# This script copies files from one directoty to a backkup directory
```

```bash
src=$1
dest=$2
```
This assigns the first command-line argument to the variable `src`(the source directory) and the second command-line argument to the variable `dest` (the destination directpry).

```bash
if [ -z "$src" ] || [ -z "$dest" ]; then
    echo "Usage: ./backup.sh <source> <destination>" # Prints a message to the user on how to use the script correctly
    exit 1
fi
```
This checks if `src` or `dest` is empty (the flag `-z` checks if a string is of length zero). It prints a usage message if either is empty.

```bash
if [ ! -d "$src" ]; then
    echo "Source directory does not exist"
    exit 1
fi
```
This checks if the source directory exists, if not, it exits with an error message

```bash
if [ ! -d "$dest" ]; then
    mkdir -p $dest # Create the backup directory if it does not exist
fi
```
This checks if the destination directory exists, if not it automatically creates one. The `-p` option ensures no error is raised if the directory already exists.

```bash
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
```

- `base=$(basename "$file")`: `basename` gets the base name of the directory (`$file`). This is the name of the directory without any leading path information.
