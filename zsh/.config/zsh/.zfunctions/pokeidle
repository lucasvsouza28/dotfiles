#!/bin/bash
# Usage: ./script.sh [number_of_instances] [game_url] [extension_id]
# Example: ./script.sh 6 https://pokeidle.io mhnplloljgchpfpcpbhmcokmnefodjnh

set -e

# Parameters with defaults
NUM_INSTANCES="${1:-4}"        # Default to 4 instances
GAME="${2:-https://pokeidle.io}"  # Default game URL
EXT_ID="${3:-mhnplloljgchpfpcpbhmcokmnefodjnh}"  # Default extension ID

CHROMIUM_BINARY="/usr/lib/chromium/chromium"

# 1. Dynamically find the extension's version directory (newest first)
EXT_VERSION_DIR=$(ls "$HOME/.config/chromium/Default/Extensions/$EXT_ID/" 2>/dev/null | sort -r | head -n 1)

if [[ -z "$EXT_VERSION_DIR" ]]; then
  echo "ERROR: Could not find extension $EXT_ID in default profile" >&2
  exit 1
fi

EXT_DIR="$HOME/.config/chromium/Default/Extensions/$EXT_ID/$EXT_VERSION_DIR"

# 2. Create and sync each profile (extensions + preferences only)
for i in $(seq 1 "$NUM_INSTANCES"); do
    dir="$HOME/chrome-pokemon/acc$i"
    echo "[$i/$NUM_INSTANCES] Setting up profile acc$i..."
    
    # Remove old profile if exists
    rm -rf "$dir"
    
    # Create the directory structure first
    mkdir -p "$dir/Default/Extensions"
    
    # Copy ONLY what's needed for extensions:
    # - Extensions folder (all installed extensions)
    # - Preferences (extension settings, enabled state, etc.)
    # - master_preferences (first-run setup, if exists)
    rsync -a \
          "$HOME/.config/chromium/Default/Extensions/" "$dir/Default/Extensions/"
    
    rsync -a "$HOME/.config/chromium/Default/Preferences" "$dir/Default/Preferences"
    
    # master_preferences might not exist in default profile
    if [[ -f "$HOME/.config/chromium/master_preferences" ]]; then
        rsync -a "$HOME/.config/chromium/master_preferences" "$dir/"
    fi
    
    echo "[$i/$NUM_INSTANCES] Profile acc$i ready"
done

# 3. Launch all instances
echo ""
echo "Launching $NUM_INSTANCES instances of Chromium..."
for i in $(seq 1 "$NUM_INSTANCES"); do
    dir="$HOME/chrome-pokemon/acc$i"
    "$CHROMIUM_BINARY" \
        --user-data-dir="$dir" \
        --no-first-run \
        --no-default-browser-check \
        --app="$GAME" &
done

echo ""
echo "✅ $NUM_INSTANCES instances launched"
echo "   Extension: mhnplloljgchpfpcpbhmcokmnefodjnh@$EXT_VERSION_DIR"
echo "   Game URL: $GAME"
echo "   Profiles: ~/chrome-pokemon/acc1 to ~/chrome-pokemon/acc$NUM_INSTANCES"