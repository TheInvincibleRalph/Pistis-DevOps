#!/bin/bash

# Database Backup Script
    # This script automates the backup of a PostgreSQL database and transfers the backup file to a remote server

# Database credentials
DB_NAME="insert_db_name"
DB_USER="insert_db_user"
DB_HOST="insert_db_host"


# Remote server credentials
REMOTE_USER="inser_remote_user"
REMOTE_HOST="inser_remote_server_ip"
REMOTE_DIR="inser_remote_directory"

BACKUP_DIR=$1
DATE=$(date +%Y-%m-%d_%H-%M)
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$DATE.sql"


# Perform PostgreSQL backup
echo "Starting backup for database $DB_NAME"
pg_dump -U $DB_USER -h $DB_HOST $DB_NAME > $BACKUP_FILE