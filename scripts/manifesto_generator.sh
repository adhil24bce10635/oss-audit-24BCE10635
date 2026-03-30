#!/bin/bash
# Script 5: Open Source Manifesto Generator

# --- Interactive Input ---
# The 'read' command captures user input into variables
echo "=========================================="
echo "   Open Source Manifesto Generator        "
echo "=========================================="
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Variables & Formatting ---
# Using the date command to timestamp the document
DATE=$(date '+%d %B %Y')
USER_NAME=$(whoami)
OUTPUT="manifesto_${USER_NAME}.txt"

# --- Content Composition ---
# String concatenation: combining variables into a single narrative block
CONTENT="--- OPEN SOURCE MANIFESTO ---
Created by: $USER_NAME
Date: $DATE

In a world of closed systems, I choose to build with transparency.
Every day, I rely on $TOOL to power my workflow, proving that community-driven
software is superior to proprietary walls. To me, open source is not just
about code; it represents '$FREEDOM' in its purest form.

My commitment to the FOSS movement is simple: I will build $BUILD
and share it freely with the world, ensuring that the next generation of
developers can learn, modify, and grow without limits.
-----------------------------"

# --- File Operations ---
# Print status message to the terminal
echo "Generating your personal philosophy file..."

# Create/Overwrite the file with the CONTENT block
echo "$CONTENT" > "$OUTPUT"

# --- Demonstration & Feedback ---
echo ""
echo "Success! Your Manifesto has been saved to: $OUTPUT"
echo "------------------------------------------"
# Displaying the final result to the terminal
cat "$OUTPUT"
echo "------------------------------------------"

# --- Concept Note: Aliases ---
# You can create a shortcut to run this generator by adding an alias
# to your ~/.bashrc file, like this:
# alias gen-manifesto='./manifesto_generator.sh'
