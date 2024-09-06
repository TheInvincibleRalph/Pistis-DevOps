## Parameter Expansion Operator in Bash (`:-`)

In Bash, `:-` is used in **parameter expansion** to provide a default value when a variable is either **unset** or **null** (empty). It's a common and powerful feature of shell scripting that helps prevent errors or unexpected behavior due to unset or empty variables.

Here are different use cases of `:-`:

### 1. **Default Value if Variable is Unset or Empty**
The most basic use case is to assign a default value if a variable is either not set or is empty (`null`).

```bash
var=${1:-"default_value"}
```

- If `$1` is passed when running the script, `var` will take the value of `$1`.
- If `$1` is not passed or is empty, `var` will default to `"default_value"`.

### 2. **Using Default for Unset Variables**
You can use `:-` to provide a default value **only if the variable is unset** (but not empty). This is useful for ensuring variables have a value even when they're not initialized.

```bash
name=${NAME:-"Unknown"}
```

- If the variable `NAME` is not set, `name` will be `"Unknown"`.
- If `NAME` is set (even to an empty string), `name` will use its value.

### 3. **Echoing with a Default Value**
You can use `:-` in command execution, such as echoing a variable with a fallback value.

```bash
echo "Hello, ${USER:-Guest}!"
```

- If `$USER` is set (e.g., `john`), it will print `"Hello, john!"`.
- If `$USER` is not set, it will print `"Hello, Guest!"`.

### 4. **Default Directory**
A common case in scripts is defaulting to the current directory if no directory is passed.

```bash
dir=${1:-.}
```

- If `$1` (the first positional parameter) is not passed, `dir` will default to the current directory `.`.

### 5. **Providing a Default Configuration**
You can use `:-` to set default configurations in a script or function if certain environment variables aren't set.

```bash
config=${CONFIG_FILE:-"/etc/default/config"}
```

- If `CONFIG_FILE` is not set, `config` will default to `/etc/default/config`.

### 6. **Default Value in Function Arguments**
When writing functions, you can use `:-` to ensure default values for function arguments.

```bash
greet() {
    local name=${1:-"stranger"}
    echo "Hello, $name!"
}
```

- If you call `greet John`, it will print `"Hello, John!"`.
- If you call `greet` without any arguments, it will print `"Hello, stranger!"`.

### 7. **Assigning Default Port for a Service**
You might want to assign a default port to a service if none is provided.

```bash
port=${PORT:-8080}
```

- If the `PORT` variable is set, it will use that value.
- If not, it will default to port `8080`.

### 8. **Combined with Conditionals**
You can combine `:-` with conditionals to check whether a value is set and take action accordingly.

```bash
log_file=${LOG_FILE:-"/var/log/default.log"}
if [[ ! -f $log_file ]]; then
    echo "Log file does not exist. Using default: $log_file"
fi
```

- This checks whether `LOG_FILE` is set. If not, it uses `/var/log/default.log` and logs a message.

### 9. **Arrays with Default Values**
You can apply this syntax even with arrays.

```bash
arr=(${MY_ARRAY[@]:-"default_value"})
```

- If `MY_ARRAY` is not set or empty, `arr` will contain `"default_value"`.