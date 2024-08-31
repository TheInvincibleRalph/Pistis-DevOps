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

### Simulation

To run the script for three servers (`server1`, `server2`, and `server3`), execute the following command:

```bash
./server.sh server1 server2 server3
```

---

### Troubleshooting

- **SSH Access Issues**: If the script fails to connect to a server, verify that the SSH access is properly configured and the user (`ubuntu`) has the necessary permissions.
- **Network Issues**: Ensure that all servers are reachable and there are no network firewalls or restrictions preventing SSH connections.
- **Script Exit**: If the script exits prematurely, check the output logs for the specific step that failed and troubleshoot accordingly.