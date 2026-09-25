#!/bin/bash 

LOG_DIR="$1"
ARCHIVE_DIR="/var/backups/log_archive"
TIME_STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p "$ARCHIVE_DIR"
tar -czf "$ARCHIVE_DIR/logs_archive_${TIME_STAMP}_backup.tar.gz" "$LOG_DIR"
echo "Archiviazione eseguita: $TIME_STAMP" >> "$ARCHIVE_DIR/archive.log"
