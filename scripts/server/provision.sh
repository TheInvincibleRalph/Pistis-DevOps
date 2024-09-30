#!/bin/bash

# This script is used to configure a newly provisioned server and does the following:

# It updates packages and upgrades them to their latest versions
# It installs other necessary packages for setup configuration
# It setup a new user with root priviledges
# It also setup firewall and enable protection against brute-force attacks
# Finally, it prints out system info after configuration

PACKAGES=(
    "ufw" # Firewall
    "fail2ban" # Security tool to ban IPs with too many failed login attempts
    "htop" # System resource monitor
    "vim"   # Text editor
    "nano"  # Text editor
    "curl"  # Command-line tool for transferring data
    "net-tools" # Networking tools
    "git" # Version control system
)

NEW_USER="TheInvincible"
PASSWORD="my_password"
SSHD_CONFIG="/etc/ssh/sshd_config"

# Update and upgrade server packages
echo "Updating and upgrading installed packages to the latest version..."
apt update -y
apt upgrade -y

# Install packages
echo "Installing necessary packages..."
apt install -y "${PACKAGES[@]}"

# UFW configuration
echo "Configuring firewall..."
ufw default deny incoming
ufw default allow outgoing
ufw allow OPENSSH # Allow SSH traffic
ufw allow 80/tcp # Allow HTTP traffic
ufw allow 443/tcp # Allow HTTPS traffic

# Enable the firewall
ufw --force enable
echo "UFW firewall is now active."

# Enable fail2ban to protect against brute-force attacks
echo "Configuring Fail2ban..."
systemctl enable fail2ban
systemctl start fail2ban

# Creating new user
echo "Off to creating a user..."
useradd -m -s /bin/bash "$NEW_USER"
echo "$NEW_USER:$PASSWORD" | chpasswd

# Promoting user to administrative role
echo "Adding user to administrative group for root privileges"
usermod -aG sudo "$NEW_USER"

# Securing SSH: Disable root login
echo "Securing SSH..."
sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' "$SSHD_CONFIG"

# Restart SSH service to apply changes
systemctl restart ssh
echo "SSH has been secured."

# Print system info after configuration
echo "Configuration completed successfully!"
echo "Server information:"
echo "Hostname: $(hostname)"
echo "IP Address: $(hostname -I | awk '{print $1}')"
echo "New user: $NEW_USER"
echo "SSH is now configured, root login disabled."

exit 0