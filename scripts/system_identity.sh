#!/bin/bash
# Script 1: System Identity Report
# Author: Adhil John Babu | Course: Open Source Software

# --- Variables ---
STUDENT_NAME="Adhil John Babu"              # Your name/identifier
SOFTWARE_CHOICE="Python"      # The specific OS or software being audited

# --- System info ---
# Using command substitution $() to capture output of system commands
KERNEL=$(uname -r)                  # Grabs the kernel release version
USER_NAME=$(whoami)                 # Grabs the current effective username
USER_HOME=$HOME                     # Uses the built-in environment variable for home directory
UPTIME=$(uptime -p)                 # Displays uptime in a "pretty" format
CURRENT_DATE=$(date +"%Y-%m-%d %H:%M:%S") # Formats date as Year-Month-Day Hour:Minute:Second
DISTRO=$(cat /etc/os-release | grep "PRETTY_NAME" | cut -d '"' -f 2) # Extracts distro name from system file

# --- Display ---
echo "=========================================="
echo " Open Source Audit — $STUDENT_NAME"
echo "=========================================="

# Displaying system identity and environment info
echo "Distribution : $DISTRO"
echo "Kernel       : $KERNEL"
echo "User         : $USER_NAME"
echo "Home Dir     : $USER_HOME"
echo "Uptime       : $UPTIME"
echo "Current Date : $CURRENT_DATE"

echo "------------------------------------------"

# --- License Message ---
# Standard message regarding the GPL, which covers the Linux Kernel
echo "System Note: This operating system is powered by the Linux kernel,"
echo "which is distributed under the GNU General Public License (GPLv2)."
echo "=========================================="
