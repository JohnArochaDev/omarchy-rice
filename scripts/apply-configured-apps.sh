#!/bin/bash
# Script adds filepaths to global window configuratior

# Filepath to global window configurations
GLOBAL_APP_PATH="$HOME/.local/share/omarchy/default/hypr/apps.conf"

# Lines to add
ASEPRITE_LINE="source = ~/.local/share/omarchy/default/hypr/apps/aseprite.conf"
GODOT_LINE="source = ~/.local/share/omarchy/default/hypr/apps/godot.conf"

# Add lines if they don't already exist (prevents duplicates)
grep -qxF "$ASEPRITE_LINE" "$GLOBAL_APP_PATH" || echo "$ASEPRITE_LINE" >> "$GLOBAL_APP_PATH"
grep -qxF "$GODOT_LINE" "$GLOBAL_APP_PATH" || echo "$GODOT_LINE" >> "$GLOBAL_APP_PATH"

echo "Added app configurations to $GLOBAL_APP_PATH"
