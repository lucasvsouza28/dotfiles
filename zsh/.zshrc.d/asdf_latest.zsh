#!/bin/zsh

# Function to check, install, and set global version for an asdf plugin
asdf_latest() {
    local plugin_name="$1"
    
    # Check if plugin name is provided
    if [[ -z "$plugin_name" ]]; then
        # echo "Usage: asdf_latest <plugin_name>"
        # echo "Example: asdf_latest nodejs"
        return 1
    fi
    
    # Check if asdf is installed
    if ! command -v asdf &> /dev/null; then
        echo "Error: asdf is not installed or not in PATH"
        return 1
    fi
    
    echo "Managing asdf plugin: $plugin_name"
    
    # Check if plugin is already installed
    if asdf plugin list | grep -q "^${plugin_name}$"; then
        echo "✓ Plugin '$plugin_name' is already installed"
    else
        echo "Installing plugin '$plugin_name'..."
        if asdf plugin add "$plugin_name"; then
            echo "✓ Plugin '$plugin_name' installed successfully"
        else
            echo "✗ Failed to install plugin '$plugin_name'"
            return 1
        fi
    fi
    
    # Get the latest version
    echo "Fetching latest version for '$plugin_name'..."
    local latest_version
    latest_version=$(asdf latest "$plugin_name" 2>/dev/null)
    
    if [[ -z "$latest_version" ]]; then
        echo "✗ Could not determine latest version for '$plugin_name'"
        return 1
    fi
    
    echo "Latest version: $latest_version"
    
    # Check if the latest version is already installed
    if asdf list "$plugin_name" 2>/dev/null | grep -q "^[[:space:]]*${latest_version}$"; then
        echo "✓ Version '$latest_version' is already installed"
    else
        echo "Installing version '$latest_version'..."
        if asdf install "$plugin_name" "$latest_version"; then
            echo "✓ Version '$latest_version' installed successfully"
            
            echo "executing asdf reshim"
            asdf reshim
        else
            echo "✗ Failed to install version '$latest_version'"
            return 1
        fi
    fi
    
    # Set as global version
    echo "Setting '$latest_version' as global version..."
    if asdf set -u "$plugin_name" "$latest_version"; then
        echo "✓ Set '$plugin_name' $latest_version as global version"
    else
        echo "✗ Failed to set global version"
        return 1
    fi
    
    # Verify the installation
    local current_version
    current_version=$(asdf current "$plugin_name" 2>/dev/null | awk '{print $2}')
    if [[ "$current_version" == "$latest_version" ]]; then
        echo "✓ Verification successful: $plugin_name $current_version is active"
    else
        echo "⚠ Warning: Expected $latest_version but got $current_version"
    fi
    
    echo "Done managing plugin '$plugin_name'"
}

# If script is called directly (not sourced), run with provided arguments
if [[ "${BASH_SOURCE[0]}" == "${0}" ]] || [[ "${(%):-%x}" == "${0}" ]]; then
    asdf_latest "$@"
fi
