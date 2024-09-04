# Troubleshooting

After configuring my Vagrantfile, I encountered an error:

```bash
==> nginx: Clearing any previously set network interfaces...
A host only network interface you're attempting to configure via DHCP
already has a conflicting host only adapter with DHCP enabled. The
DHCP on this adapter is incompatible with the DHCP settings. Two
host only network interfaces are not allowed to overlap, and each
host only network interface can have only one DHCP server. Please
reconfigure your host only network or remove the virtual machine
using the other host only network.
```

### Understanding the error:

**What is a Host-Only Network?**
- A host-only network is a type of network connection that VirtualBox creates to allow communication between your host machine (the computer running VirtualBox) and virtual machines (VMs) running on VirtualBox, without allowing the VMs to directly access the wider internet.
- Each host-only network has its own network adapter, and VirtualBox assigns IP addresses within a specific range to these adapters. A DHCP server can also be configured to assign IP addresses automatically to devices connected to this network.

### Possible causes of error:

- Multiple host-only networks can exist due to different Vagrant projects, manually configured setups, or leftover configurations from past VMs.
- Conflicts occur when more than one host-only network has DHCP enabled or when their IP ranges overlap.
- Use the VirtualBox Host Network Manager to view, adjust, or remove these host-only networks to resolve DHCP conflicts.

### How I solved the error:

In my Vagrantfile, instead of using DHCP, I set the network configuration to a static IP replacing this:
```vagrantfile
config.vm.network "private_network", type: "dhcp"
```

with this:

```vagrantfile
config.vm.network "private_network", ip: "192.168.56.10"
```

An alternative solution would be to manage the network configuration via VirtualBox:

1. **Open VirtualBox**:
   - Launch the VirtualBox application on your host machine.

2. **Access Host Network Manager**:
   - In VirtualBox, go to the menu: `File` > `Host Network Manager`.
   - This will show you a list of all host-only network adapters configured in VirtualBox.

3. **Review Network Adapters**:
   - Each adapter will have an associated name like `vboxnet0`, `vboxnet1`, etc.
   - Review the IP address range and DHCP settings for each adapter.

4. **Identify Conflicting DHCP Servers**:
   - Check if multiple adapters have DHCP enabled. If so, there might be a conflict, especially if their IP ranges overlap or if Vagrant tries to use an adapter that already has a DHCP server running.

5. **Resolve Conflicts**:
   - You can either disable the DHCP server on one of the conflicting host-only networks or delete an unnecessary host-only network adapter to avoid conflicts.
   - To disable DHCP, select the adapter and uncheck the "DHCP Server" option.
   - To delete a network, select the adapter and click the "Remove" button.

> To further avoid DHCP conflicts in the Vagrant configuration, I assigned static IP addresses to all the virtual machines instead of relying on DHCP.

---
## Localhost compatibility

To make the loadbalancer (nginx) and the webservers accessible via localhost, I configured the Vagrantfile to forward ports from the virtual machines to my host machine. 

```ruby
Vagrant.configure("2") do |config|
  # Nginx Load Balancer VM
  config.vm.define "nginx" do |nginx|
    nginx.vm.box = "ubuntu/bionic64"
    nginx.vm.network "private_network", type: "dhcp"
    nginx.vm.network "forwarded_port", guest: 80, host: 8080 # port forwarding
    nginx.vm.provision "shell", path: "provision/nginx.sh"
  end
  ```

  Forwarded Port: The `nginx.vm.network "forwarded_port", guest: 80, host: 8080` line forwards port `80` on the Nginx VM to port `8080` on my local machine.

---

## Error Type: `Timeout`

  ```bash
Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
  ```

## Understanding the error:

The `Timed out while waiting for the machine to boot` error typically occurs when Vagrant is unable to establish a connection with the virtual machine within the allotted time. This can be due to various reasons, such as slow VM startup, networking issues, or resource limitations on your host machine.

## Possible causes of error:

  The issue of `web1` taking too long to boot can stem from various factors. Here are some possible reasons and suggestions to troubleshoot and resolve the issue:

### 1. **Network Configuration**:
   - **IP Conflicts**: The IP `192.168.56.11` might be conflicting with another device. The solution to this is to try changing the IP address to something else within the same subnet or use DHCP instead.

### 2. **Resource Allocation**:
   - **Memory and CPU**: Insufficient memory or CPU resources on the host machine can slow down the boot process, especially if multiple VMs are running.

### 3. **Provisioning Issues**:
   - **Slow Package Installation**: The `apt-get update` and `apt-get install -y nginx` commands might be slow due to network issues.


## How I solved the error:

I increased the memory allocated to the VMs:

```ruby
config.vm.provider "virtualbox" do |vb|
  vb.memory = "1024"  # Increase memory allocation to 1 GB
  vb.cpus = 2         # Assign 2 CPUs
end
```

