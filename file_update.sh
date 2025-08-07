#!/bin/bash

# Check if a filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

FILENAME=$1
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
CUSTOM_MSG="The script has been triggered and new verision controlled created"

# Create the file if it doesn't exist
if [ ! -f "$FILENAME" ]; then
  echo "Creating new file: $FILENAME"
  touch "$FILENAME"
fi

# Append timestamp + message
echo "$TIMESTAMP - $CUSTOM_MSG" >> "$FILENAME"

# Git operations
git add "$FILENAME"
git commit -m "Updated $FILENAME with timestamp and message"
git push origin main
