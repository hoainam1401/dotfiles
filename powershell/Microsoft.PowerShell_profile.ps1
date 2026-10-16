# Native Windows profile. WSL uses the repository's Zsh configuration instead.
$env:STARSHIP_CONFIG = Join-Path $HOME ".config\starship.toml"

if (Get-Module -ListAvailable -Name PSReadLine) {
    Import-Module PSReadLine
    Set-PSReadLineOption -EditMode Emacs
    Set-PSReadLineOption -HistoryNoDuplicates
    Set-PSReadLineOption -HistorySearchCursorMovesToEnd
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
}

if (Get-Command nvim -ErrorAction SilentlyContinue) {
    Set-Alias vim nvim
    Set-Alias v nvim
}

Remove-Item Alias:ls -ErrorAction SilentlyContinue
function ls {
    if (Get-Command lsd -ErrorAction SilentlyContinue) { lsd --group-dirs first @args }
    elseif (Get-Command eza -ErrorAction SilentlyContinue) { eza --group-directories-first --icons=auto @args }
    else { Get-ChildItem @args }
}

function l {
    if (Get-Command lsd -ErrorAction SilentlyContinue) { lsd -l --group-dirs first @args }
    elseif (Get-Command eza -ErrorAction SilentlyContinue) { eza -l --group-directories-first --icons=auto @args }
    else { Get-ChildItem @args }
}

function la {
    if (Get-Command lsd -ErrorAction SilentlyContinue) { lsd -a --group-dirs first @args }
    elseif (Get-Command eza -ErrorAction SilentlyContinue) { eza -a --group-directories-first --icons=auto @args }
    else { Get-ChildItem -Force @args }
}

function lla {
    if (Get-Command lsd -ErrorAction SilentlyContinue) { lsd -la --group-dirs first @args }
    elseif (Get-Command eza -ErrorAction SilentlyContinue) { eza -la --group-directories-first --icons=auto @args }
    else { Get-ChildItem -Force @args | Format-List }
}

function lt {
    if (Get-Command lsd -ErrorAction SilentlyContinue) { lsd --tree --depth 2 @args }
    elseif (Get-Command eza -ErrorAction SilentlyContinue) { eza --tree --level=2 --icons=auto @args }
    else { tree /F @args }
}

function mkcd([Parameter(Mandatory)][string]$Path) {
    New-Item -ItemType Directory -Force -Path $Path | Out-Null
    Set-Location $Path
}

function fetch {
    if (Get-Command fastfetch -ErrorAction SilentlyContinue) { fastfetch @args }
}

if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}
