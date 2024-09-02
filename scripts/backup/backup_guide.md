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

- `base=$(basename "$file")`: `basename` gets the base name of the directory (`$file`). This is the name of the directory without any leading path information. If the destination already contains a directory with the same name, it prints a message indicating that the directory is being skipped to avoid overwriting data or duplication:

```bash
theinvincible@TheInvincible:~$ basename /home/theinvincible
theinvincible
```

## Single conditional sqaure bracket (`[...]`) Vs. Double conditional (`[[...]]`)square bracket

In shell scripting, double square brackets (`[[ ... ]]`) are an enhanced version of the single square brackets (`[ ... ]`). They provide additional functionality and flexibility when writing conditional expressions. Both are used for testing conditions, but `[[ ... ]]` has some advantages and differences compared to `[ ... ]`. Let's explore these differences:

### Differences Between `[ ... ]` and `[[ ... ]]`

1. **Enhanced Test Capabilities**:
   - **String Comparisons**: With `[[ ... ]]`, you can use more complex pattern matching like `==` with globbing (wildcards) or regular expressions. For example:
     ```bash
     if [[ $string == pattern* ]]; then
         echo "The string starts with 'pattern'."
     fi
     ```
     This checks if `$string` starts with `pattern`. The single brackets `[ ... ]` do not support this kind of pattern matching directly.

2. **Logical Operators**:
   - `[[ ... ]]` supports logical operators like `&&` (and) and `||` (or) directly within the test. This is more intuitive and easier to read than using nested `if` statements or combining commands with `-a` and `-o` as you might need to with `[ ... ]`.
     ```bash
     if [[ -d $dir && -w $dir ]]; then
         echo "Directory exists and is writable."
     fi
     ```

3. **No Word Splitting or Filename Expansion**:
   - When using `[[ ... ]]`, you don't need to worry as much about word splitting or filename expansion (also known as globbing). This makes `[[ ... ]]` safer and more predictable when dealing with strings that might contain spaces or special characters.
     ```bash
     file="my file with spaces.txt"
     if [[ -e $file ]]; then
         echo "File exists."
     fi
     ```
     In this example, the `[[ ... ]]` syntax handles spaces correctly without needing to quote the variable `$file`.

4. **Regular Expressions**:
   - `[[ ... ]]` can directly support regular expression comparisons using the `=~` operator. This allows for powerful pattern matching within conditions:
     ```bash
     if [[ $input =~ ^[0-9]+$ ]]; then
         echo "Input is a number."
     fi
     ```
     Here, `=~` checks if the `$input` variable matches the regular expression for a sequence of digits.

5. **Greater Syntax Flexibility**:
   - With `[[ ... ]]`, you don't need to quote variables to protect against empty or special character values. This provides a more robust syntax that avoids common pitfalls in shell scripting:
     ```bash
     if [[ $var == "" ]]; then
         echo "Variable is empty."
     fi
     ```

6. **No Need for Escaping Special Characters**:
   - Certain special characters within `[[ ... ]]` do not need to be escaped, unlike with `[ ... ]`. This includes characters like `<`, `>`, `!`, and `|`. For example:
     ```bash
     if [[ $var < "hello" ]]; then
         echo "var is less than 'hello'."
     fi
     ```
     In the example above, using `<` in single brackets would be interpreted as a redirection operator, which could lead to syntax errors or unintended behavior.

### Example Comparison

Here's a practical comparison between using single and double square brackets:

**Using Single Square Brackets**:

```bash
name="Alice"
if [ "$name" = "Alice" ] && [ -f /etc/passwd ]; then
    echo "Name is Alice and /etc/passwd exists."
fi
```

**Using Double Square Brackets**:

```bash
name="Alice"
if [[ $name == "Alice" && -f /etc/passwd ]]; then
    echo "Name is Alice and /etc/passwd exists."
fi
```

In the example with double square brackets:

- The condition is more concise because it uses `&&` directly for logical AND.
- It can handle strings with spaces or special characters more safely without needing to quote variables as rigidly.
- Pattern matching and comparison operations are more flexible.

### Summary

- **Single Square Brackets (`[ ... ]`)**: The traditional test command, suitable for basic checks and conditions.
- **Double Square Brackets (`[[ ... ]]`)**: An enhanced test command with extended capabilities, better suited for complex conditions, pattern matching, logical operations, and safer string handling.

In practice, when writing shell scripts, you should prefer `[[ ... ]]` when possible due to its additional features and flexibility. It makes scripts more robust, readable, and capable of handling complex conditional logic.