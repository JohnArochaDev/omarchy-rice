#!/bin/bash

# This modifies the Hyprland bindings configurstion


# Set variables
CONFIG_FILE="$HOME/.config/hypr/bindings.conf"
OLD_TERMINAL_CMD="SUPER, RETURN"
NEW_TERMINAL_CMD="SUPER, T"

# Check if config file exists
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: COnfig file not found at $CONFIG_FILE"
  exit 1
fi

# Create backup of original config
BACKUP_FILE="{$CONFIG_FILE}.backup"
cp "$CONFIG_FILE" "$BACKUP_FILE"
echo "Backup created at: $BACKUP_FILE"

# Replace the binding with sed

# CHanges terminal keybind to SUPER + T
sed -i "s/bindd = SUPER, RETURN, Terminal/bindd = SUPER, T, Terminal/" "$CONFIG_FILE"

# Check if change was made
if grep -q "s/bindd = SUPER, T, Terminal" "$CONFIG_FILE"; then
  echo "Successfully changed terminal hotkey to SUPER + T"
else
  echo "Warning: Could not find the binding to change"
fi

echo ""
echo "Done! Press SUPER + SHIFT + R to reload Hyprland Config"
