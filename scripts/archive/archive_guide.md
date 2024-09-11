
```bash
tar -czf "$archive_name" -C "$dir" .
```

### 1. `-c`: Create an Archive
- The `-c` flag stands for "create." It tells `tar` that we want to create a new archive file.

### 2. `-z`: Compress with gzip
- The `-z` flag tells `tar` to compress the archive using `gzip`. This produces a `.tar.gz` file. Without `-z`, `tar` would only create a `.tar` archive, which is uncompressed.

### 3. `-f`: File Name
- The `-f` flag specifies the output filename for the archive. In this case, `$archive_name` is the name of the archive file, which includes the timestamp and ends with `.tar.gz`.

### 4. `-C`: Change Directory
- The `-C` flag tells `tar` to change to the directory specified right after the flag before creating the archive. This avoids including the full directory path inside the archive. By using `-C "$dir"`, it changes to that directory, and the `.` means to include all files and directories within the current directory (`"$dir"`) in the archive.

### 5. `.` (Dot): Current Directory
- The `.` represents the current directory and is used after the `-C` flag. Since `tar` is already in the directory specified by `-C`, the dot tells `tar` to archive everything in that directory.