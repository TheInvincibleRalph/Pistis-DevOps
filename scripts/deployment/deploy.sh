#!/bin/bash

# Set variables for Go, Node.js, and Python services
APP_NAME="my-web-app"
APP_DIR="/var/www/my-web-app"
SERVICE_GO="go-app-service"                       # Systemd service name for the Go app
SERVICE_NODE="node-app-service"                   # Systemd service name for the Node.js app
SERVICE_PYTHON="python-app-service"               # Systemd service name for the Python app
REPO_URL="git@github.com:user/repo.git"           # Git repository URL
BRANCH="main"                                     # The branch you want to deploy
NGINX_CONF="/etc/nginx/sites-available/$APP_NAME" # NGINX config file
HEALTH_CHECK_URL="http://localhost"               # Health check URL

# Start deployment
echo "Starting deployment for $APP_NAME"

cd $APP_DIR || {
    echo "Directory $APP_DIR not found"
    exit 1
}

echo "Pulling latest code from $REPO_URL (branch: $BRANCH)"
git fetch origin $BRANCH
git reset --hard origin/$BRANCH

# -----------------------Go Service-----------------------
echo "Buildig and deploying Go service"

cd "$APP_DIR/go-service" || {
    echo "Go service directpry bot found"
    exit 1
}

go build -o my-go-app main.go || {
    echo "Go build failed"
    exit 1
}

echo "Restarting Go service: $SERVICE_GO"

sudo systemctl restart SERVICE_GO
sudo systemctl status SERVICE_GO --no-pager

# -----------------------Node.js Service-----------------------
echo "Installing dependencies and deploying Node.js service"

cd "$APP_DIR/node-service" || {
    echo "Node.js service directory not found"
    exit 1
}

npm install --production || {
    echo "Node.js dependency installation failed"
    exit 1
}

echo "Restarting Node.js service: $SERVICE_NODE"

sudo systemctl restart "$SERVICE_NODE"
sudo systemctl status $SERVICE_NODE --no-pager

# -----------------------Python Service-----------------------
echo "Installing dependencies and deploying Python service"

cd "$APP_DIR/python-service" || {
    echo "Python service directory not found"
    exit 1
}

pip install -r requirements.txt || {
    echo "Python dependency installation failed"
    exit 1
}

echo "Restarting Python service: $SERVICE_PYTHON"

sudo systemctl restart $SERVICE_PYTHON
sudo systemctl status $SERVICE_PYTHON --no-pager

# Restart NGINX if necessary

if [ -f "$NGINX_CONF" ]; then
    echo "Reloading NGINX"
    sudo nginx -t && sudo systemctl reload nginx
else
    echo "NGINX configuration not found at $NGINX_CONF"
fi

# Perform health check (optional)
echo "Performing health check at $HEALTH_CHECK_URL"
curl -f $HEALTH_CHECK_URL && echo "Health check passed!" || echo "Health check failed!"

echo "Deployment finished!"
