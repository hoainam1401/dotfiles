# Dotfiles

Catppuccin Mocha terminal and editor configuration shared across macOS, Linux,
WSL, and native Windows.

## Platform support

| Tool | macOS | Linux | Windows |
| --- | --- | --- | --- |
| Starship | Zsh | Zsh | PowerShell 7 |
| Shell profile | Zsh | Zsh | PowerShell 7 |
| tmux | Native | Native | WSL |
| Cava | CoreAudio tap | Automatic | Automatic / WSL |

Native Windows uses PowerShell because Zsh and tmux are Unix applications. Use
WSL when you want the complete Zsh and tmux experience on Windows.

## Requirements

- A [Nerd Font](https://www.nerdfonts.com/) for icons
- `starship`
- Optional: `lsd` or `eza`, `fastfetch`, `nvim`, `cava`, and `tmux`
- Optional Zsh plugins: `zsh-autosuggestions`, `zsh-syntax-highlighting`, and
  `zsh-history-substring-search`
- Optional tmux plugins: [TPM](https://github.com/tmux-plugins/tpm) and
  `christoomey/vim-tmux-navigator`

The shell configuration checks whether optional commands and plugins exist, so
missing extras do not break startup.

### macOS

```sh
brew install starship tmux cava lsd fastfetch neovim \
  zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search
./install.sh
```

### Linux or WSL

Install the packages above with your distribution's package manager, then run:

```sh
./install.sh
```

The Cava config uses automatic audio detection on Linux. Under WSL, Cava needs
audio forwarding from Windows (WSLg/PulseAudio) to visualize system audio.

### Native Windows

Install PowerShell 7 and Starship, open PowerShell in this repository, then run:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
.\install.ps1
```

The Windows installer copies files instead of creating symbolic links, so it
works without Administrator access or Developer Mode. Re-run it after pulling
configuration updates.

## What the installers change

The Unix installer links only these core files:

- `~/.zshrc` and `~/.zprofile`
- `~/.tmux.conf`
- `~/.config/starship.toml`
- `~/.config/cava/config` and Cava shaders

The Windows installer copies the Starship, Cava, and PowerShell profiles to
their standard locations. Existing files are moved to a timestamped directory
under `~/.dotfiles-backup` before replacement.

Other application folders in this repository can be linked manually as needed;
several, such as AeroSpace and SketchyBar, are intentionally macOS-only.
