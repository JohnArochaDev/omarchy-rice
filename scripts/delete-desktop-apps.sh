#!/bin/bash

# Script to delete unwanted desktop applications

echo "Removing unwanted desktop apps"
echo ""

# List of individual filepaths to delete

FILEPATHS_TO_REMOVE=(
    # Web apps
    "$HOME/.local/share/applications/Basecamp.desktop"
    "$HOME/.local/share/applications/ChatGPT.desktop"
    "$HOME/.local/share/applications/Figma.desktop"
    "$HOME/.local/share/applications/Fizzy.desktop"
    "$HOME/.local/share/applications/HEY.desktop"
    "$HOME/.local/share/applications/WhatsApp.desktop"
    "$HOME/.local/share/applications/X.desktop"
    "$HOME/.local/share/applications/Zoom.desktop"
    
    # Google apps
    "$HOME/.local/share/applications/Google Contacts.desktop"
    "$HOME/.local/share/applications/Google Maps.desktop"
    "$HOME/.local/share/applications/Google Messages.desktop"
    "$HOME/.local/share/applications/Google Photos.desktop"
)

for filepath in "${FILEPATHS_TO_REMOVE[@]}"; do
  if [ -f "$filepath" ]; then
      rm "$filepath"
      echo "✓ Removed $filepath"
  else
      echo "⊘ $filepath not found, skipping"
  fi
  echo ""
done

echo "Restarting Walker..."
omarchy-restart-walker
echo "Done!"
