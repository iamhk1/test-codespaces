#!/bin/bash
set -e

echo "Running post-start configuration..."

# Check if WAKATIME_API_KEY environment variable exists
if [ -n "$WAKATIME_API_KEY" ]; then
  echo "Found WakaTime API key in environment variables"
  
  # Update the WakaTime config with the API key
  mkdir -p $HOME/.wakatime
  cat > $HOME/.wakatime/.wakatime.cfg << CONFIG
[settings]
debug = false
api_key = $WAKATIME_API_KEY
CONFIG
  
  echo "✅ WakaTime configured automatically with provided API key"
else
  echo "⚠️ No WakaTime API key found in environment variables"
  echo "Please run 'WakaTime: API Key' from the Command Palette to configure manually"
fi

# Create a heartbeat file to ensure WakaTime is working
echo "Testing WakaTime integration..."
touch $HOME/wakatime-test.txt
sleep 2
rm $HOME/wakatime-test.txt

echo "✅ Post-start configuration complete!"
