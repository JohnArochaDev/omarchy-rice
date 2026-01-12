#!/bin/bash

# This modifies the Hyprland bindings configuration

# Set variables
CONFIG_FILE="$HOME/.config/hypr/bindings.conf"
TILING_CONFIG_FILE="$HOME/.local/share/omarchy/default/hypr/bindings/tiling-v2.conf"
NEW_CLOSE_WINDOW_CMD="bindd = SUPER, W, Close window, killactive,"

# Check if config files exist
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: Config file not found at $CONFIG_FILE"
  exit 1
fi

if [ ! -f "$TILING_CONFIG_FILE" ]; then
  echo "Error: Tiling config file not found at $TILING_CONFIG_FILE"
  exit 1
fi

echo "Updating keybindings..."
echo ""

# Change terminal keybind from SUPER + RETURN to SUPER + T
sed -i "s/bindd = SUPER, RETURN, Terminal/bindd = SUPER, T, Terminal/" "$CONFIG_FILE"

# Delete line 8 (old SUPER + T binding) from tiling config
sed -i '8d' "$TILING_CONFIG_FILE"

# Delete line 2 (old SUPER + W binding) from tiling config
sed -i '2d' "$TILING_CONFIG_FILE"

# Check if terminal keybind change was successful
if grep -q "bindd = SUPER, T, Terminal" "$CONFIG_FILE"; then
  echo "✓ Successfully changed terminal hotkey to SUPER + T"
else
  echo "✗ Warning: Could not change terminal binding"
fi

# Check if old SUPER + W binding still exists
if grep -q "bindd = SUPER, W, Close window, killactive," "$CONFIG_FILE"; then
  echo "✓ SUPER + W close window binding already exists"
else
  # Add new SUPER + W binding to close windows
  echo "$NEW_CLOSE_WINDOW_CMD" >> "$CONFIG_FILE"
  echo "✓ Successfully added SUPER + W to close windows"
fi

echo ""
echo "Done! Press SUPER + SHIFT + R to reload Hyprland config"
