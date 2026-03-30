#!/bin/bash
# Script 3: Disk and Permission Auditor

# --- Variables ---
# Array containing the directories we want to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

# --- Audit Loop ---
echo "=========================================="
echo "      Directory Audit Report              "
echo "=========================================="
echo "------------------------------------------"

# The 'for' loop iterates through each element in the DIRS array
for DIR in "${DIRS[@]}"; do
    # Check if the directory actually exists on the system
    if [ -d "$DIR" ]; then
        # 'ls -ld' lists directory info; 'awk' extracts permissions ($1), owner ($3), and group ($4)
        PERMS=$(ls -ld "$DIR" | awk '{print $1, "Owner:", $3, "Group:", $4}')

        # 'du -sh' calculates disk usage in human-readable format
        # 2>/dev/null hides permission denied errors for specific subfolders
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "DIR  : $DIR"
        echo "INFO : $PERMS"
        echo "SIZE : $SIZE"
        echo "------------------------------------------"
    else
        # Error handling for missing directories
        echo "[!] $DIR does not exist on this system."
        echo "------------------------------------------"
    fi
done

# --- Python Config Check ---
# Searching for the standard Python3 config directory location
PY_CONF="/usr/lib/python3"

echo ">>> Python Config Audit:"
if [ -d "$PY_CONF" ]; then
    # Extracting permissions specifically for the Python configuration
    PY_PERMS=$(ls -ld "$PY_CONF" | awk '{print $1}')
    echo "Location    : $PY_CONF"
    echo "Permissions : $PY_PERMS"
else
    echo "Note: Python config directory not found at $PY_CONF"
fi
echo "=========================================="
