#!/bin/bash
set -e

echo "Setting up WakaTime time tracking..."

# Create WakaTime config directory
mkdir -p $HOME/.wakatime

# Create a placeholder config file if it doesn't exist
if [ ! -f $HOME/.wakatime/.wakatime.cfg ]; then
  echo "Creating default WakaTime config..."
  cat > $HOME/.wakatime/.wakatime.cfg << CONFIG
[settings]
debug = false
api_key = 
CONFIG
fi

# Make the scripts directory executable
chmod +x ./.devcontainer/scripts/*.sh

echo "✅ WakaTime setup complete!"
