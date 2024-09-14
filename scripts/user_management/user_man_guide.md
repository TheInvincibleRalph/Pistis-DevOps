## EUID

`EUID` stands for **Effective User ID** in Linux and Unix-like operating systems. It represents the user ID that is being used by the current process to determine what privileges it has for accessing system resources.

### Key Points:
- **Real User ID (RUID)**: This is the ID of the user who started the process. It represents the original identity of the user.
- **Effective User ID (EUID)**: This is the ID that the operating system uses to check permissions. It may differ from the RUID if a program runs with elevated privileges (e.g., using `sudo` or setuid).
- **Saved User ID (SUID)**: Used in certain privilege management scenarios, especially when switching between effective and real user IDs.

### Example:
When you run a script or a command with `sudo`, the **EUID** is set to `0` (the root user), even though your **RUID** remains the ID of your regular user.

In the context of a shell script:

```bash
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi
```

Here, the script checks if the **EUID** is **not equal** (`-ne`) to `0`, meaning the user isn't root, and if so, it prints an error message and exits. This ensures that certain commands that require root privileges are only executed by the root user.

---

## Explaining the `getopts` loop:

### `while getopts "a:d:m:l:h" opt; do ... done`

- **`while`**: Starts a loop that will continue to run as long as `getopts` successfully parses command-line options.
- **`getopts "a:d:m:l:h" opt`**: 
  - **`getopts`** is a built-in shell function that parses command-line options. It processes each option passed to the script (e.g., `-a`, `-d`, `-m`, etc.).
  - The string `"a:d:m:l:h"` tells `getopts` what options to expect:
    - **`a:`**, **`d:`**, **`m:`**: These options require an argument (the `:` means the option expects an argument).
    - **`l`**: This option requires 1 as an argument 
    - **`h`**: This option does not require an argument.
  - **`opt`**: A variable that stores the current option being processed by `getopts`.

### `do ... done`

- **`do ... done`**: This marks the start and end of the loop. For each option found by `getopts`, the commands between `do` and `done` are executed.

### `case ${opt} in`

- **`case`**: This is a conditional statement in bash, similar to `switch` in other programming languages. It checks the value of `opt` and executes different code depending on which option was passed.
- **`${opt}`**: Refers to the current option (`-a`, `-d`, `-m`, `-l`, or `-h`) being processed.
- **`in`**: Part of the syntax to start the `case` block.

### `a ) user_add="$OPTARG" ;;`

- **`a )`**: This matches when the current option is `-a`.
- **`user_add="$OPTARG"`**: Assigns the argument passed with `-a` to the variable `user_add`. 
  - **`$OPTARG`**: This is the argument provided to the current option (for `-a`, it's the username). `getopts` automatically assigns the argument to this variable.
- **`;;`**: Ends this particular `case` branch.

### `d ) user_del="$OPTARG" ;;`

- **`d )`**: This matches when the current option is `-d`.
- **`user_del="$OPTARG"`**: Assigns the argument passed with `-d` to the variable `user_del` (e.g., a username to delete).
- **`;;`**: Ends this branch of the `case`.

### `m ) user_mod="$OPTARG" ;;`

- **`m )`**: Matches when the current option is `-m`.
- **`user_mod="$OPTARG"`**: Assigns the argument passed with `-m` to the variable `user_mod`.
- **`;;`**: Ends this branch.

### `l ) list_users=1 ;;`

- **`l )`**: Matches when the current option is `-l`.
- **`list_users=1`**: Sets the variable `list_users` to `1` (true). This flag indicates the user wants to list all users.
- **`;;`**: Ends this branch.

### `h ) echo "Usage: $0 [-a username] [-d username] [-m username] [-l] [-h]"; exit 0 ;;`

- **`h )`**: Matches when the current option is `-h`.
- **`echo "Usage: $0 [-a username] [-d username] [-m username] [-l] [-h]"`**: Prints a usage message that tells the user how to use the script.
  - **`$0`**: Refers to the script's name (i.e., how the script was invoked).
- **`exit 0`**: Exits the script with a success code (`0` means success).
- **`;;`**: Ends this branch.

### `\? ) echo "Invalid option"; exit 1 ;;`

- **`\? )`**: This matches any invalid option (i.e., an option not defined in `"a:d:m:l:h"`). The backslash (`\`) escapes the `?` so that it works as part of the `case` statement.
- **`echo "Invalid option"`**: Prints an error message indicating the option was invalid.
- **`exit 1`**: Exits the script with an error code (`1` indicates failure).
- **`;;`**: Ends this branch.



> - [How to Use Bash Getopts With Examples](https://kodekloud.com/blog/bash-getopts/#:~:text=Getopts%20is%20a%20powerful%20shell,scripts%20more%20readable%20and%20maintainable)