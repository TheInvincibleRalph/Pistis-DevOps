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

# Function to deploy the renewed certificates (reload the web server)
deploy_certificates() {
    echo "$(date): Deploying new SSL certificates and reloading $WEB_SERVER..." | tee -a "$LOG_FILE"

    # Reload the web server to use the new certificates
    systemctl reload "$WEB_SERVER"

    if [[ $? -eq 0 ]]; then
        echo "$(date): $WEB_SERVER successfully reloaded with the new certificates." | tee -a "$LOG_FILE"
    else
        echo "$(date): Failed to reload $WEB_SERVER!" | tee -a "$LOG_FILE"
    fi
}