#!/bin/bash

# Script to update fastfetch configuration

echo "Configuring fastfetch..."
echo ""

# Get the directory where THIS script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Filepaths
FASTFETCH_DIR="$HOME/.config/fastfetch"
FASTFETCH_CONFIG="$FASTFETCH_DIR/config.jsonc"
ASCII_SOURCE="$SCRIPT_DIR/../files/ascii.txt"  # Relative to script location
ASCII_DEST="$FASTFETCH_DIR/ascii.txt"

# Create fastfetch directory if it doesn't exist
if [ ! -d "$FASTFETCH_DIR" ]; then
    echo "Warning: fastfetch directory not found"
    exit 1
fi

# Copy ASCII file if it exists
if [ -f "$ASCII_SOURCE" ]; then
    cp "$ASCII_SOURCE" "$ASCII_DEST"
    echo "✓ Copied ASCII art to $ASCII_DEST"
else
    echo "✗ ASCII file not found at $ASCII_SOURCE"
    exit 1
fi

# Update config file if it exists
if [ -f "$FASTFETCH_CONFIG" ]; then
    sed -i 's|"source": "~/.config/omarchy/branding/about.txt"|"source": "~/.config/fastfetch/ascii.txt"|g' "$FASTFETCH_CONFIG" # Ignore the comma needed, it will remain after the operation
    echo "✓ Updated fastfetch config"
else
    echo "⊘ Config file doesn't exist, creating new one..."
    exit 1
fi

echo ""
echo "Done! Run 'fastfetch' or SUPER + T to see the fastfetch art."