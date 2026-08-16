#!/bin/bash
# Rust Desk Client Installer for Linux (wickedyoda configuration)
# This script downloads and installs Rust Desk pre-configured for rd.wickedyoda.com

set -e

echo "Installing Rust Desk Client for Wickedyoda..."

# Detect architecture
ARCH=$(uname -m)
case $ARCH in
    x86_64)  RUSTDESK_ARCH="x86_64" ;;
    aarch64) RUSTDESK_ARCH="aarch64" ;;
    armv7l)  RUSTDESK_ARCH="armv7" ;;
    *)       echo "Unsupported architecture: $ARCH" && exit 1 ;;
esac

# Detect package manager
if command -v apt &>/dev/null; then
    PKG_MANAGER="apt"
elif command -v yum &>/dev/null; then
    PKG_MANAGER="yum"
elif command -v pacman &>/dev/null; then
    PKG_MANAGER="pacman"
else
    PKG_MANAGER="none"
fi

# Download Rust Desk
REPO="rustdesk/rustdesk"
LATEST_TAG=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

echo "Latest version: ${LATEST_TAG}"

# Download appropriate package
case $PKG_MANAGER in
    apt)
        DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep "browser_download_url" | grep "deb" | grep "$RUSTDESK_ARCH" | cut -d '"' -f 4)
        curl -L "$DOWNLOAD_URL" -o /tmp/rustdesk.deb
        sudo dpkg -i /tmp/rustdesk.deb || sudo apt-get install -f -y
        ;;
    yum)
        DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep "browser_download_url" | grep "rpm" | grep "$RUSTDESK_ARCH" | cut -d '"' -f 4)
        curl -L "$DOWNLOAD_URL" -o /tmp/rustdesk.rpm
        sudo rpm -i /tmp/rustdesk.rpm
        ;;
    *)
        # Generic AppImage
        DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep "browser_download_url" | grep "AppImage" | grep "$RUSTDESK_ARCH" | cut -d '"' -f 4)
        curl -L "$DOWNLOAD_URL" -o /tmp/rustdesk.AppImage
        chmod +x /tmp/rustdesk.AppImage
        sudo mv /tmp/rustdesk.AppImage /usr/local/bin/rustdesk
        ;;
esac

# Create configuration directory
CONFIG_DIR="$HOME/.config/rustdesk"
mkdir -p "$CONFIG_DIR"

# Copy pre-configured local.json
curl -s "https://raw.githubusercontent.com/wickedyoda/rustdesk-client/main/local.json" -o "$CONFIG_DIR/local.json"

echo ""
echo "✅ Rust Desk installed and configured for rd.wickedyoda.com!"
echo "   Run 'rustdesk' to start the client"
echo ""
echo "Server settings:"
echo "  • ID Server: rd.wickedyoda.com:21115"
echo "  • Relay Server: rd.wickedyoda.com:21116"
echo "  • API Server: rd.wickedyoda.com:21117"
echo "  • Encryption: Enabled"
