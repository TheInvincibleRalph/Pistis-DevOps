# Bash Script for Server Management Guide

> This documentation provides a comprehensive guide on how to use the `server.sh` Bash script which has been designed to update and upgrade multiple servers, as well as install Nginx and Apache web servers on each of them.

---

### Requirements

Before running this script, ensure the following prerequisites are met:

- **SSH Access:** The user running the script must have SSH access to the target servers. The script assumes that the SSH user is *ubuntu.* (based on AWS convention)
**Permissions:** The user should have sudo privileges on the target servers to perform package updates and installations.
**Network Connectivity:** The user should ensure the servers are reachable over the network.

---
### Input Parameters

- **Server Hostnames:** The script expects a list of server hostnames or IP addresses as input parameters. These are passed to the script as command-line arguments.

---

### How to Run the Script

1. **Save the Script**: Save the provided Bash script into a file, e.g., `server.sh`.
2. **Make the Script Executable**: Run the following command to make the script executable:
   ```bash
   chmod +x server.sh
   ```
3. **Execute the Script**: Run the script with the server hostnames as arguments. For example:
   ```bash
   ./server.sh <server1> <server2>
   ```
---

### Interpreting the Output

- **Success Messages**: If the operations are successful, you will see output messages indicating completion, such as:

  ```bash
  Updating and upgrading all servers...
  Update and upgrade complete on <server1>
  Installing Nginx on <server1>...
  Nginx installation complete on <server1>
  Installing Apache on <server1>...
  Apache installation complete on <server1>
  ```

- **Failure Messages**: If any operation fails, an error message will be displayed, and the script will exit with a non-zero status.

---

### Writing the Script

Our script is started with the so called *Shebang* statement:

```bash
#!/bin/bash
```

All that the shebang does is to instruct the operating system to run the
script with the `/bin/bash` executable

The Shebang declaration is followed by some lines of comment stating what the script intends to achieve:

```bash
# BASH script that does the following:
# - Update and upgrade all servers
# - Installs Nginx and Apache on each server
```

```bash
server_name=$(hostname)

set -e  # Exit immediately if a command exits with a non-zero status
```
`set -e`: This command makes the script exit immediately if any command within the script returns a non-zero status. This ensures that if any step fails, the script stops execution to prevent further errors.

`server_name=$(hostname)`: This line assigns the result of the hostname command to the variable `server_name`. The hostname command returns the name of the current machine.

**Defining Functions:**

- `update_server()`: 

```bash
# Function to update and upgrade a specified server
function update_server() {
    local server_name=$1
    echo "Updating and upgrading all servers..."
    if ssh ubuntu@"$server_name" 'sudo apt-get update -y && sudo apt-get upgrade -y'; then
        echo "Update and upgrade complete on $server_name."
    else
        echo "Failed to update and upgrade $server_name."
        exit 1
    fi
}
```
This function takes the server name as an argument, connects to the server via SSH, and performs a system update and upgrade using `apt-get`. The `local server_name=$1` line declares a local variable `server_name` and assigns it the value of the first argument passed to the function (`$1`). Using local limits the scope of `server_name` to this function only. The function generally uses `sudo` (which has superuser privileges) to run the commands and `y` to automatically answer "yes" to prompts. Finally, if the `ssh` command fails, the script prints an error message.


- `install_nginx()` and `install_nginx()`:

```bash
# Function to install Nginx on a specified server
function install_nginx() {
    local server_name=$1
   echo "Installing Nginx on $server_name..."
   if ssh ubuntu@"$server_name" 'sudo apt-get install nginx -y'; then
        echo "Nginx installation complete on $server_name."
    else
        echo "Failed to install Nginx on $server_name."
        exit 1
    fi
}

# Function to install Apache on a specified server
function install_apache() {
    local server_name=$1
    echo "Installing Apache on $server_name..."
    if ssh ubuntu@"$server_name" 'sudo apt-get install apache2 -y'; then
        echo "Apache installation complete on $server_name."
    else
        echo "Failed to install Apache on $server_name."
        exit 1
    fi
}
```

The `install_nginx()` and `install_nginx()` functions look similar to the `update_server()` function except for the local commands that perform the installations: `sudo apt-get install nginx -y` for nginx installation and `sudo apt-get install apache2 -y update_server()` for apache.

- `main` function:

```bash
function main() {

    for server in "$@"; do
    update_server "$server"
    install_nginx "$server"
    install_apache "$server"
    done
}
```

`function main()` defines the main function, which is the central point of execution for this script. It loops over each argument passed to the script as captured by `$@`. For each argument, it assigns the value to `server` and executes the commands inside the loop by calling each functions against each command-line arguments.

```bash
# pass all command-line arguments to the main function
main "$@"
```
This line calls the main function and passes all command-line arguments to it. The `"$@"` syntax ensures that each argument is passed separately, preserving any spaces in arguments.

---

### Simulation

To run the script for three servers (`server1`, `server2`, and `server3`), execute the following command:

```bash
chmod +x update_and_install.sh # to make the  script executable
./server.sh server1 server2 server3
```

**Expected output should like this:**

```bash
Updating and upgrading all servers...
Update and upgrade complete on server1.
Installing Apache on server1...
Nginx installation complete on server1.
Installing Apache on server1...
Apache installation complete on server1.

Updating and upgrading all servers...
Update and upgrade complete on server2.
Installing Nginx on server2...
Nginx installation complete on server2.
Installing Apache on server2...
Apache installation complete on server2.

Updating and upgrading all servers...
Update and upgrade complete on server3.
Installing Nginx on server3...
Nginx installation complete on server3.
Installing Apache on server3...
Apache installation complete on server3.
```
---

### Troubleshooting

- **SSH Access Issues**: If the script fails to connect to a server, verify that the SSH access is properly configured and the user (`ubuntu`) has the necessary permissions.
- **Network Issues**: Ensure that all servers are reachable and there are no network firewalls or restrictions preventing SSH connections.
- **Script Exit**: If the script exits prematurely, check the output logs for the specific step that failed and troubleshoot accordingly.