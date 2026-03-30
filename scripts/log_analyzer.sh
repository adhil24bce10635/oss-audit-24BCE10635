#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./log_analyzer.sh [logfile_path]

# --- Variables ---
LOGFILE=$1
# ${2:-"error"} uses a default value of "error" if the second argument is missing
KEYWORD=${2:-"error"} 
COUNT=0

# --- File Validation ---
# -f checks if the file exists and is a regular file
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    echo "Usage: $0 /path/to/logfile [keyword]"
    exit 1
fi

# --- Check if File is Empty (Wait/Retry Logic) ---
# A simple check to ensure the log file actually has content to read
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: $LOGFILE is currently empty. Checking again in 2 seconds..."
    sleep 2
    if [ ! -s "$LOGFILE" ]; then
        echo "Error: File is still empty. Exiting."
        exit 1
    fi
fi

# --- Processing Loop ---
# 'while read' reads the file line by line to prevent memory overflow on large logs
# IFS= (Internal Field Separator) prevents stripping leading/trailing whitespace
# -r prevents backslash characters from being interpreted as escape characters
while IFS= read -r LINE; do
    # grep -iq: 'i' for case-insensitive, 'q' for quiet (we only care about the exit status)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # Arithmetic expansion to increment the counter
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Summary Display ---
echo "=========================================="
echo "         Log Analysis Summary             "
echo "=========================================="
echo "File Checked : $LOGFILE"
echo "Keyword      : $KEYWORD"
echo "Total Matches: $COUNT"
echo "------------------------------------------"

# --- Display Last 5 Matches ---
# Using tail to show the most recent occurrences found in the log
echo "Last 5 matching entries:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
echo "=========================================="
