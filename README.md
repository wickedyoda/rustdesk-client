# Rust Desk Client for Wickedyoda

Pre-configured Rust Desk client packages for connecting to `rd.wickedyoda.com`

## Quick Install

### Linux
```bash
curl -s https://raw.githubusercontent.com/WickedYoda/rustdesk-client/main/scripts/install-linux.sh | bash
```

Or download directly from `/clients/`:
```bash
curl -L https://raw.githubusercontent.com/WickedYoda/rustdesk-client/main/clients/rustdesk-wickedyoda-linux-x86_64.AppImage -o rustdesk && chmod +x rustdesk && ./rustdesk
```

### Windows
Download `rustdesk-wickedyoda-windows-x86_64.exe` from the [`/clients/` directory](https://github.com/WickedYoda/rustdesk-client/tree/main/clients) and install with pre-configured settings.

### macOS
Download `rustdesk-wickedyoda-macos-aarch64.dmg` from the [`/clients/` directory](https://github.com/WickedYoda/rustdesk-client/tree/main/clients):

```bash
# Download and mount
curl -L https://raw.githubusercontent.com/WickedYoda/rustdesk-client/main/clients/rustdesk-wickedyoda-macos-aarch64.dmg -o rustdesk.dmg
open rustdesk.dmg
```

## Available Clients

All pre-built clients are available in the [`/clients/` directory](https://github.com/WickedYoda/rustdesk-client/tree/main/clients):

| Platform | File | SHA256 |
|----------|------|--------|
| Linux aarch64 | `rustdesk-wickedyoda-linux-aarch64.AppImage` | `a955a100d9c83ec7...` |
| Linux x86_64 | `rustdesk-wickedyoda-linux-x86_64.AppImage` | `7902cd60a4f29817...` |
| macOS | `rustdesk-wickedyoda-macos-aarch64.dmg` | `f7935597b247d42c...` |
| Windows | `rustdesk-wickedyoda-windows-x86_64.exe` | `eaedeb0088e687bf...` |

### Verify Downloads

Download and verify checksums:

```bash
# Download all files
curl -L https://raw.githubusercontent.com/WickedYoda/rustdesk-client/main/clients/SHA256SUMS -o SHA256SUMS
curl -L https://raw.githubusercontent.com/WickedYoda/rustdesk-client/main/clients/rustdesk-wickedyoda-linux-x86_64.AppImage -o rustdesk-wickedyoda-linux-x86_64.AppImage

# Verify the hash
sha256sum -c SHA256SUMS --ignore-missing
```

## Server Details

- **ID Server**: `rd.wickedyoda.com:21115`
- **Relay Server**: `rd.wickedyoda.com:21116`
- **API Server**: `rd.wickedyoda.com:21117`
- **Key**: `vBWa4z9UmOgwMeuvDwzwE05+S8K4U6UBrr3nlENUa6A=`
- **Encrypted**: Yes

## Configuration Files

- `local.json` - Rust Desk client configuration
- `scripts/install-linux.sh` - Linux installation script
- `scripts/setup-windows.ps1` - Windows PowerShell setup script
- `scripts/install-macos.sh` - macOS installation script

## GitHub Actions

This repository uses GitHub Actions to automatically build and publish client packages:

- **Build**: Pre-built clients are published to `/clients/` on every push to `main`
- **CI Validation**: Code quality checks (yamllint, shellcheck)
- **Security Scan**: Trivy vulnerability scanning, Gitleaks secrets detection
