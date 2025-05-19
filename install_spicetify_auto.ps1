
# Modified Spicetify install script - no prompts

Write-Host "Setting up..."
$spicetifyPath = "$env:LOCALAPPDATA\spicetify"

if (-not (Test-Path $spicetifyPath)) {
    Write-Host "Spicetify not found."
    Write-Host "Installing it for you..."
    Invoke-WebRequest -Uri "https://github.com/spicetify/spicetify-cli/releases/latest/download/spicetify-windows-x64.zip" -OutFile "$env:TEMP\\spicetify-cli.zip"
    Expand-Archive -Path "$env:TEMP\spicetify-cli.zip" -DestinationPath $spicetifyPath -Force
    $env:PATH += ";$spicetifyPath"
}

Write-Host "spicetify was successfully installed!"

# Install Marketplace automatically
Write-Host "Installing Spicetify Marketplace..."
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1" | Invoke-Expression

Write-Host "Done! Spicetify and Marketplace are ready to use."
