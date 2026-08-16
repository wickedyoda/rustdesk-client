# PowerShell script to install Rust Desk for Wickedyoda on Windows
# Run as Administrator

param(
    [string]$DownloadPath = "$env:TEMP\rustdesk-wickedyoda"
)

$ErrorActionPreference = "Stop"

Write-Host "Installing Rust Desk for Wickedyoda..." -ForegroundColor Green
New-Item -ItemType Directory -Path $DownloadPath -Force | Out-Null

# Get latest release
$Repo = "rustdesk/rustdesk"
$Release = Invoke-RestMethod "https://api.github.com/repos/$Repo/releases/latest"
$Tag = $Release.tag_name

Write-Host "Latest version: $Tag" -ForegroundColor Yellow

# Download Windows installer
$DownloadUrl = $Release.assets | Where-Object { $_.name -like "*x86_64.exe" } | Select-Object -First 1 -ExpandProperty browser_download_url
$InstallerPath = "$DownloadPath\rustdesk-setup.exe"

Write-Host "Downloading Rust Desk..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $DownloadUrl -OutFile $InstallerPath

Write-Host "Installing Rust Desk..." -ForegroundColor Cyan
Start-Process -FilePath $InstallerPath -Args "/S" -Wait

# Configure
$ConfigDir = "$env:APPDATA\rustdesk"
if (!(Test-Path $ConfigDir)) {
    New-Item -ItemType Directory -Path $ConfigDir -Force | Out-Null
}

# Download configuration
$ConfigUrl = "https://raw.githubusercontent.com/wickedyoda/rustdesk-client/main/local.json"
$ConfigPath = "$ConfigDir\local.json"
Invoke-WebRequest -Uri $ConfigUrl -OutFile $ConfigPath

Write-Host "✅ Rust Desk installed and configured for rd.wickedyoda.com!" -ForegroundColor Green
Write-Host "   Server settings applied:" -ForegroundColor Yellow
Write-Host "   • ID Server: rd.wickedyoda.com:21115"
Write-Host "   • Relay Server: rd.wickedyoda.com:21116"
Write-Host "   • API Server: rd.wickedyoda.com:21117"
Write-Host "   • Encryption: Enabled"
