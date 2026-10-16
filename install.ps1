$ErrorActionPreference = "Stop"

$RepoDir = $PSScriptRoot
$BackupDir = Join-Path $HOME ".dotfiles-backup\$(Get-Date -Format 'yyyyMMdd-HHmmss')"

function Install-ConfigFile {
    param(
        [Parameter(Mandatory)][string]$Source,
        [Parameter(Mandatory)][string]$Destination
    )

    $parent = Split-Path -Parent $Destination
    New-Item -ItemType Directory -Force -Path $parent | Out-Null

    if (Test-Path $Destination) {
        New-Item -ItemType Directory -Force -Path $BackupDir | Out-Null
        $name = ($Destination.Replace($HOME, "").TrimStart("\") -replace '[\\/:]', '__')
        Move-Item -Force $Destination (Join-Path $BackupDir $name)
        Write-Host "Backed up: $Destination"
    }

    # Copying works without Administrator or Windows Developer Mode.
    Copy-Item -Force $Source $Destination
    Write-Host "Installed: $Destination"
}

Install-ConfigFile `
    -Source (Join-Path $RepoDir "starship\catppuccin_mocha.toml") `
    -Destination (Join-Path $HOME ".config\starship.toml")

Install-ConfigFile `
    -Source (Join-Path $RepoDir "cava\config") `
    -Destination (Join-Path $HOME ".config\cava\config")

Install-ConfigFile `
    -Source (Join-Path $RepoDir "powershell\Microsoft.PowerShell_profile.ps1") `
    -Destination $PROFILE.CurrentUserAllHosts

Write-Host "`nWindows terminal configuration installed. Restart PowerShell."
if (Test-Path $BackupDir) {
    Write-Host "Previous files were saved in: $BackupDir"
}
