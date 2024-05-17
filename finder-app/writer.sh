#!/bin/sh

set -e
set -u

if [ $# -ne 2 ]; then
    echo "Two parameters needed: the first is the file path including filename, and the second is the string to be written."
    exit 1
else
    FILE=$1
    STR=$2
fi

# Extract directory path from the file path
dirpath=$(dirname "$FILE")

# Check if the directory exists, create it if it doesn't
if [ ! -d "$dirpath" ]; then
    echo "Creating directory '$dirpath'..."
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Directory '$dirpath' could not be created."
        exit 1
    fi
fi

# Write the string to the file
echo "$STR" > "$FILE"

# Check if the file was created successfully
if [ -f "$FILE" ]; then
    echo "File '$FILE' created successfully with content: $STR"
else
    echo "Error: File '$FILE' could not be created."
    exit 1
fi

