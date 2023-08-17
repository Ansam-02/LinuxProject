

#!/bin/bash

# Get the current date and time in the required format
CURRENT_DATETIME=$(date +"%Y-%m-%dT%H-%M")

# Define filenames for log and compressed file
LOG_FILENAME="kernel-logs-${CURRENT_DATETIME}.txt"
COMPRESSED_FILENAME="kernel-logs-${CURRENT_DATETIME}.tar.bz2"

# Extract kernel logs from the last hour and save to a text file
journalctl --since "1 hour ago" -k > "$LOG_FILENAME"

# Compress the text file using tar and bzip2
tar -cjvf "$COMPRESSED_FILENAME" "$LOG_FILENAME"

# Use dbxcli to upload the compressed file to Dropbox
dbxcli put "$COMPRESSED_FILENAME"  "/home/ansam/Dropbox"

# Clean up temporary files
rm "$LOG_FILENAME" "$COMPRESSED_FILENAME"

