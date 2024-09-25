#!/bin/bash

# Define the domain for which SSL certificates will be renewed
DOMAIN="domain_name.com"

# Define the path where the certificates are stored (where Certbot saves them)
CERT_PATH="/etc/letsencrypt/live/$DOMAIN"

# Define the webserver type (nginx or apache)
WEB_SERVER="nginx"

# Log file for renewal process
LOG_FILE="/var/log/cert_renewal.log"

renew_certificate() {
    echo "$(date): Checking for SSL certificate renewal..." | tee -a "$LOG_FILE"

    certbot renew --quiet --no-self-upgrade --post-hook "systemctl reload $WEB_SERVER" 2>> "$LOG_FILE"

    if [[ $? -eq 0]]; then
    echo "$(date): SSL certificates have been renewed successfully." | tee -a "LOG_FILE"
     else
        echo "$(date): Certbot failed to renew certificates!" | tee -a "$LOG_FILE"
    fi
}