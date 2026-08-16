# Rust Desk Client for Wickedyoda

Pre-configured Rust Desk client packages for connecting to `rd.wickedyoda.com`

## Quick Install

### Linux
```bash
curl -s https://raw.githubusercontent.com/WickedYoda/rustdesk-client/main/scripts/install-linux.sh | bash
```

### Windows
Download `rustdesk-client-windows.exe` from releases and install with pre-configured settings.

### macOS
```bash
# Download the AppImage or use Homebrew
brew install --cask rustdesk
# Configuration is applied automatically
```

## Server Details
- **ID Server**: `rd.wickedyoda.com:21115`
- **Relay Server**: `rd.wickedyoda.com:21116` 
- **API Server**: `rd.wickedyoda.com:21117`
- **Key**: `vBWa4z9UmOgwMeuvDwzwE05+S8K4U6UBrr3nlENUa6A=`
- **Encrypted**: Yes

## Configuration Files
- `local.json` - Rust Desk client configuration
- `installer.sh` - Linux installation script
- `setup.ps1` - Windows PowerShell setup script
- `install.sh` - macOS installation script

## GitHub Actions
This repository uses GitHub Actions to automatically build client packages on every release.
