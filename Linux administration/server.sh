#!/bin/bash

# BASH script that does the following:
# - Update and upgrade all servers
# - Installs Nginx and Apache on each server


server_name=$(hostname)

set -e  # Exit immediately if a command exits with a non-zero status

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

# Function to install Nginx on a specified server
function install_nginx() {
    local server_name=$1
   echo "Installing Apache on $server_name..."
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

function main() {

    for server in "$@"; do
    update_server "$server"
    install_nginx "$server"
    install_apache "$server"
    done
}

# pass all command-line arguments to the main function
main "$@"