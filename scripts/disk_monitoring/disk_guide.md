## Detailed explanation of the code

The command `USAGE=$(df -h / | grep '/' | awk '{ print $5 }' | sed 's/%//g')` is a compound shell command that retrieves and processes the disk usage percentage of the root (`/`) filesystem in a Linux or Unix environment. Here's a detailed explanation of each part:

### **1. `df -h /`**
- **`df`**: The `df` command stands for "disk filesystem" and is used to display information about the disk space usage of mounted filesystems.
- **`-h`**: The `-h` option stands for "human-readable." It makes the output easier to read by displaying sizes in kilobytes (K), megabytes (M), gigabytes (G), etc., instead of bytes.
- **`/`**: This specifies the root filesystem as the target. The root filesystem (`/`) is the top level of the filesystem hierarchy.

**Example output of `df -h /`:**
```plaintext
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   30G   20G  60% /
```
This output shows that the root filesystem (`/`) is mounted on `/dev/sda1`, with 50 GB of total space, 30 GB used, 20 GB available, and 60% of the space used.

### **2. `grep '/'`**
- **`grep`**: The `grep` command is used to search for specific patterns in the output of other commands or in files.
- **`'/'`**: This is the pattern that `grep` is searching for in the output. It matches the line containing the `/` mount point, which is the root filesystem.

Since the `df -h /` command specifically targets the root filesystem, the `grep '/'` is redundant here because it will always match the line returned by `df -h /`. However, it ensures that we are working with the correct line if more lines were in the output.

**Example output of `df -h / | grep '/'`:**
```plaintext
/dev/sda1        50G   30G   20G  60% /
```

### **3. `awk '{ print $5 }'`**
- **`awk`**: `awk` is a powerful text-processing tool. In this context, it's being used to extract specific fields from the line of text.
- **`'{ print $5 }'`**: This instructs `awk` to print the fifth field of the matched line. Fields in a line are typically separated by spaces or tabs, and `awk` counts from left to right. In the example line:
  ```plaintext
  /dev/sda1        50G   30G   20G  60% /
  ```
  The fifth field (`$5`) is `60%`, which represents the percentage of disk space used.

**Output of `df -h / | grep '/' | awk '{ print $5 }'`:**
```plaintext
60%
```

### **4. `sed 's/%//g'`**
- **`sed`**: `sed` is a stream editor that can perform basic text transformations on an input stream.
- **`'s/%//g'`**: This is a `sed` command that replaces all occurrences of the `%` symbol with nothing (i.e., removes it).
  - **`s`**: Stands for "substitute."
  - **`%`**: The character to be removed.
  - **`//`**: Indicates that `%` should be replaced with nothing.
  - **`g`**: Stands for "global," meaning all occurrences of `%` in the input should be removed.

**Output of `df -h / | grep '/' | awk '{ print $5 }' | sed 's/%//g'`:**
```plaintext
60
```

### **5. `USAGE=$(...)`**
- **`USAGE=`**: This is a variable assignment in shell scripting. The result of the command inside the parentheses `$(...)` is stored in the variable `USAGE`.

**Final Value of `USAGE`:**
- The `USAGE` variable will contain the numeric value of the disk usage percentage for the root filesystem. In this case, `USAGE` will be `60`.

---

### **Introduction to `awk` and `sed`**

`awk` and `sed` are two powerful text processing utilities in Unix-like operating systems. They are frequently used for data extraction, text processing, and pattern matching. Understanding these tools can significantly enhance your ability to manipulate text in shell scripting and command-line operations.

---

### **`awk`**

`awk` is a versatile programming language designed for text processing and typically used as a data extraction and reporting tool. It processes text files by reading one line at a time, breaking each line into fields, and performing specified operations on those fields.

#### **Key Features and Usage**

1. **Field-based Processing:**
   - `awk` automatically divides each line of input into fields (columns) based on a delimiter (default is whitespace).
   - Each field can be accessed using the `$` symbol followed by a number. For example, `$1` refers to the first field, `$2` to the second, and so on.

2. **Basic Syntax:**
   ```bash
   awk 'pattern { action }' filename
   ```
   - **pattern**: The condition that the line must satisfy to execute the action.
   - **action**: The operation performed on lines that match the pattern.

3. **Examples:**

   - **Print the third field of each line:**
     ```bash
     awk '{ print $3 }' file.txt
     ```
   - **Print lines where the first field is greater than 100:**
     ```bash
     awk '$1 > 100 { print }' file.txt
     ```
   - **Calculate the sum of the second field for all lines:**
     ```bash
     awk '{ sum += $2 } END { print sum }' file.txt
     ```

4. **Field and Record Separators:**
   - By default, `awk` uses whitespace as the field separator and newline as the record separator. These can be customized with `-F` (field separator) and `RS` (record separator).
   - Example: Using a comma as the field separator in a CSV file:
     ```bash
     awk -F, '{ print $1, $3 }' file.csv
     ```

#### **Advanced Features**

- **Patterns:** You can use regular expressions to match patterns.
- **Built-in Variables:** `awk` has several built-in variables like `NR` (current record number), `NF` (number of fields in the current record), and `FS` (field separator).
- **Control Flow:** `awk` supports control structures like `if`, `while`, and `for` loops, making it a full-fledged scripting language.

---

### **`sed`**

`sed`, short for "stream editor," is a non-interactive text editor. Unlike traditional text editors, which require user interaction, `sed` operates on a stream of text (typically from a file or input) and applies editing commands on-the-fly.

#### **Key Features and Usage**

1. **Basic Syntax:**
   ```bash
   sed 'command' filename
   ```
   - **command**: Specifies the editing operation `sed` should perform on the input text.

2. **Common Commands:**

   - **Substitute (`s`):**
     - The `s` command replaces text in the input stream.
     - Basic format:
       ```bash
       sed 's/pattern/replacement/' file.txt
       ```
     - Example: Replace "cat" with "dog":
       ```bash
       sed 's/cat/dog/' file.txt
       ```
     - Use the `g` flag to replace all occurrences in a line:
       ```bash
       sed 's/cat/dog/g' file.txt
       ```

   - **Delete (`d`):**
     - The `d` command deletes lines from the input stream.
     - Example: Delete lines that contain "error":
       ```bash
       sed '/error/d' file.txt
       ```

   - **Print (`p`):**
     - The `p` command prints lines to standard output. Useful with `-n` to suppress automatic printing.
     - Example: Print only lines containing "success":
       ```bash
       sed -n '/success/p' file.txt
       ```

3. **Addressing:**
   - `sed` allows you to target specific lines or ranges of lines.
   - Example: Replace text on the second line only:
     ```bash
     sed '2s/foo/bar/' file.txt
     ```
   - Example: Replace text between lines 10 and 20:
     ```bash
     sed '10,20s/foo/bar/' file.txt
     ```

#### **Advanced Features**

- **In-place Editing:** Modify files directly with the `-i` option:
  ```bash
  sed -i 's/foo/bar/g' file.txt
  ```
- **Regular Expressions:** `sed` supports extended regular expressions for complex pattern matching.
  ```bash
  sed -E 's/[0-9]{3}-[0-9]{2}-[0-9]{4}/XXX-XX-XXXX/' file.txt
  ```
- **Multiple Commands:** Use the `-e` option or semicolons to apply multiple commands:
  ```bash
  sed -e 's/foo/bar/' -e 's/cat/dog/' file.txt
  ```
  Or:
  ```bash
  sed 's/foo/bar/; s/cat/dog/' file.txt
  ```

---

### **Comparison and Use Cases**

- **`awk` vs `sed`:**
  - **`awk`** is more powerful for field-based processing and can perform arithmetic and logical operations, making it ideal for tasks like extracting columns from a CSV, calculating sums, or generating reports.
  - **`sed`** is faster for simple substitutions and deletions, making it more suitable for quick text replacements or line-based edits in large files.

- **Use Case for `awk`:**
  - Parsing a log file to extract and summarize specific fields (e.g., IP addresses, response times).
  - Generating reports by aggregating data based on specific patterns.

- **Use Case for `sed`:**
  - Quickly replacing a string across multiple files.
  - Cleaning up or reformatting data (e.g., removing unwanted characters, correcting format).

---

## Disk Monitoring: `df` vs `du`

The `df` and `du` commands in Linux are both used to report disk usage, but they serve different purposes and provide different types of information. Here's a breakdown of their differences:

### 1. **Purpose**

- **`df` (Disk Filesystem Usage)**:
  - Reports the overall disk space usage for mounted filesystems.
  - It shows the amount of disk space used and available on the entire filesystem (e.g., hard drives, partitions).
  - Primarily used to get an overview of disk usage at the filesystem level.

- **`du` (Disk Usage of Files and Directories)**:
  - Reports the disk space used by specific files and directories.
  - It calculates the size of files and directories, summing up their total usage.
  - Primarily used to see how much space individual files or directories are consuming.

### 2. **Output Information**

- **`df`**:
  - Displays information such as total disk space, used space, available space, and the percentage of space used.
  - Output typically includes columns for Filesystem, Size, Used, Available, Use%, and Mounted on.

  Example:
  ```bash
  df -h
  ```
  ```
  Filesystem      Size  Used Avail Use% Mounted on
  /dev/sda1        50G   30G   20G  60% /
  /dev/sdb1       100G   70G   30G  70% /mnt/storage
  ```

- **`du`**:
  - Displays the disk usage of files and directories, often in a hierarchical manner.
  - Output includes the size of each file and directory in the specified path.

  Example:
  ```bash
  du -h /home/user
  ```
  ```
  100K    /home/user/docs
  2.3M    /home/user/pictures
  5.6G    /home/user/videos
  6.0G    /home/user
  ```

### 3. **Scope**

- **`df`**:
  - Works at the filesystem level, showing information about entire disks or partitions.
  - It does not drill down into individual files or directories.

- **`du`**:
  - Works at the file and directory level, showing detailed information about how much space each item is consuming.
  - It can provide a summary of disk usage for specific directories or files.

### 4. **Performance**

- **`df`**:
  - Typically faster because it reads the filesystem metadata rather than scanning the entire directory structure.

- **`du`**:
  - Can be slower, especially for large directories, because it has to traverse the directory tree to sum up the sizes of files and subdirectories.

### 5. **Common Use Cases**

- **`df`**:
  - Quickly checking overall disk space usage and available space on the entire system.
  - Monitoring disk space to avoid running out of space on a filesystem.

- **`du`**:
  - Identifying which files or directories are consuming the most disk space.
  - Cleaning up disk space by finding and removing large, unnecessary files or directories.

### 6. **Usage Context**

- **`df`**:
  - Example: Checking how much space is left on your root filesystem:
    ```bash
    df -h /
    ```

- **`du`**:
  - Example: Finding the largest directories in your home folder:
    ```bash
    du -sh /home/user/*
    ```