#!/bin/bash

# This script automates the process of creating users, setting default passwords,
# and configuring user permissions.

# 1. Check if the script is run as root (EUID 0)
if [ $EUID -ne 0 ]; then
    echo "Run this script as root"
    exit 1
fi

while getopts "a:d:m:l:h" opt; do
    case ${opt} in
    a) user_add="$OPTARG" ;;
    d) user_del="$OPTARG" ;;
    m) user_mod="$OPTARG" ;;
    l) list_user=1 ;;
    h)
        echo "Usage: $0 [-a username] [-d username] [-m username] [-l] [-h]"
        exit 0
        ;;
    \?)
        echo "Invalid option"
        exit 1
        ;;
    esac
done

# 3. Add a new user
if [[ ! -z "$user_add" ]]; then
    if id "$user_add" &>/dev/null; then
        echo "User $user_add already exists"
    else
        useradd -m "$user_add"
        passwd "$user_add"
        echo "User "$user_add" created"
    fi
fi

# 4. Delete a user
if [[ ! -z "$user_del" ]]; then
    if id "$user_del" &>/dev/null; then
        userdel -r "$user_del"
        echo "User $user_del deleted"
    else
        echo "User "$user_del" does not exist"
    fi
fi

# 5. Modify a user (in this case, changes the user’s shell)
if [[ ! -z "$user_mod" ]]; then
    if id "$user_mod" &>/dev/null; then
        echo "Modifying user $user_mod"
        usermod -s /bin/bash "$user_mod"

    else
        echo "User "$user_mod" does not exist"
    fi
fi

# 6. List users
if [[ "$list_users" -eq 1 ]]; then
    echo "Listing users:"
    cut -d: -f1 /etc/passwd
fi
