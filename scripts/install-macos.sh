#!/bin/bash
# Rust Desk Client Installer for macOS
# Installs Rust Desk and applies Wickedyoda configuration

set -e

echo "Installing Rust Desk Client for Wickedyoda (macOS)..."

# Check for Homebrew
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Rust Desk via Homebrew Cask
brew install --cask rustdesk

# Create configuration directory
CONFIG_DIR="$HOME/Library/Application Support/rustdesk"
mkdir -p "$CONFIG_DIR"

# Copy pre-configured local.json
curl -s "https://raw.githubusercontent.com/wickedyoda/rustdesk-client/main/local.json" -o "$CONFIG_DIR/local.json"

echo ""
echo "✅ Rust Desk installed and configured for rd.wickedyoda.com!"
echo "   Launch Rust Desk from Applications"
echo ""
echo "Server settings:"
echo "  • ID Server: rd.wickedyoda.com:21115"
echo "  • Relay Server: rd.wickedyoda.com:21116"
echo "  • API Server: rd.wickedyoda.com:21117"
echo "  • Encryption: Enabled"
