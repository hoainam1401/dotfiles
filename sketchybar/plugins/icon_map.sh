#!/usr/bin/env sh

# Nerd Font symbols for common macOS applications. Add more cases here using
# the application name returned by:
# aerospace list-windows --all --format '%{app-name}'
app_icon() {
  case "$1" in
    Safari)                         printf '%s\n' '󰀹' ;;
    "Google Chrome"|Chromium)       printf '%s\n' '󰊯' ;;
    Firefox*)                       printf '%s\n' '󰈹' ;;
    Arc)                            printf '%s\n' '󰞍' ;;
    ChatGPT)                        printf '%s\n' '󰭹' ;;
    Kitty|kitty|Terminal|iTerm2|WezTerm|Ghostty)
                                    printf '%s\n' '󰆍' ;;
    Neovim|nvim)                    printf '%s\n' '' ;;
    "Visual Studio Code"|Code)      printf '%s\n' '󰨞' ;;
    Cursor)                         printf '%s\n' '󰇀' ;;
    Finder)                         printf '%s\n' '󰀶' ;;
    Spotify)                        printf '%s\n' '󰓇' ;;
    Discord|Vesktop)                printf '%s\n' '󰙯' ;;
    Steam)                          printf '%s\n' '󰓓' ;;
    Battle.net)                     printf '%s\n' '󰊴' ;;
    CrossOver|Wine*)                printf '%s\n' '󰡶' ;;
    CurseForge)                     printf '%s\n' '󰍳' ;;
    "Dota 2")                      printf '%s\n' '󰺵' ;;
    "StarCraft II")                printf '%s\n' '󰊠' ;;
    Mail|"Microsoft Outlook")      printf '%s\n' '󰇮' ;;
    Calendar)                       printf '%s\n' '󰃭' ;;
    Messages)                       printf '%s\n' '󰍦' ;;
    Slack)                          printf '%s\n' '󰒱' ;;
    Notion)                         printf '%s\n' '󰰒' ;;
    Obsidian)                       printf '%s\n' '󱓧' ;;
    Preview)                        printf '%s\n' '󰋩' ;;
    "System Settings"|"System Preferences")
                                    printf '%s\n' '󰒓' ;;
    *)                              printf '%s\n' '󰣆' ;;
  esac
}
