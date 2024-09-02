#!/bin/bash

# This scripts is used for user management
# It asks for the user's name and password

read -p "Enter username: " user # The -p falgs places the prompt and input space on the same line.
read -sp "Enter password: " password # The -s flags makes the input silent which is used for hiding the user's input.
echo # For new line
echo "Login successful"