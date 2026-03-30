#!/bin/bash
# Script 2: FOSS Package Inspector

# --- Variables ---
PACKAGE="python3"

# --- Check if package is installed ---
# In Kali (Debian), we use dpkg -l to check for installed packages.
# grep -w ensures we find the exact word "python3"
if dpkg -l | grep -qw "$PACKAGE"; then
    echo "=========================================="
    echo "SUCCESS: $PACKAGE is installed."
    echo "------------------------------------------"
    # Show version and description from the Debian package manager
    apt-cache show $PACKAGE | grep -E 'Version|License|Description' | head -n 3
else
    echo "=========================================="
    echo "ALERT: $PACKAGE is NOT installed."
    echo "Try: sudo apt update && sudo apt install $PACKAGE"
    exit 1
fi

# --- Philosophy Case Statement ---
echo "------------------------------------------"
case $PACKAGE in
    httpd|apache2)
        echo "Apache: The web server that built the open internet." ;;
    mysql|mariadb-server)
        echo "MySQL/MariaDB: Open source at the heart of millions of apps." ;;
    python3)
        echo "Python: A powerful language focused on readability and developer productivity." ;;
    vlc)
        echo "VLC: The versatile media player that handles almost any format." ;;
    firefox-esr)
        echo "Firefox: Putting people before profits in the world of web browsing." ;;
    *)
        echo "Package Info: An essential component of the FOSS ecosystem." ;;
esac
echo "=========================================="
