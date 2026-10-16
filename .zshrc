# Shared interactive Zsh configuration for macOS, Linux, and WSL.

# Homebrew is normally initialized by ~/.zprofile. Keep non-login shells robust.
if (( ! $+commands[brew] )); then
  for brew_bin in /opt/homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
    if [[ -x "$brew_bin" ]]; then
      eval "$($brew_bin shellenv)"
      break
    fi
  done
fi

[[ -d "$HOME/.local/bin" ]] && path=("$HOME/.local/bin" $path)
[[ -d "$HOME/.nvim-python/bin" ]] && path=("$HOME/.nvim-python/bin" $path)
[[ -d "$HOME/Library/Python/3.9/bin" ]] && path=("$HOME/Library/Python/3.9/bin" $path)
typeset -U path PATH

export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-$EDITOR}"
export PAGER="${PAGER:-less}"
export LESS="${LESS:--R -F -X}"

# History: shared between terminals, de-duplicated, and written immediately.
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt APPEND_HISTORY INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS HIST_REDUCE_BLANKS
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS

# Add Homebrew completions when available, then use a cached completion dump.
if (( $+commands[brew] )); then
  brew_prefix="${HOMEBREW_PREFIX:-$(brew --prefix 2>/dev/null)}"
  [[ -d "$brew_prefix/share/zsh-completions" ]] && fpath=("$brew_prefix/share/zsh-completions" $fpath)
fi
autoload -Uz compinit
compinit -C -d "${ZDOTDIR:-$HOME}/.zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

# Load a plugin from the first path provided by the current package manager.
source_first() {
  local plugin
  for plugin in "$@"; do
    if [[ -r "$plugin" ]]; then
      source "$plugin"
      return 0
    fi
  done
  return 1
}

plugin_prefix="${HOMEBREW_PREFIX:-/opt/homebrew}"
source_first \
  "$plugin_prefix/share/zsh-history-substring-search/zsh-history-substring-search.zsh" \
  /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh \
  /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh \
  "$HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh"

source_first \
  "$plugin_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
  "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6c7086,italic'
bindkey -e
(( $+functions[history-substring-search-up] )) && bindkey '^[[A' history-substring-search-up
(( $+functions[history-substring-search-down] )) && bindkey '^[[B' history-substring-search-down
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

if (( $+commands[lsd] )); then
  alias ls='lsd --group-dirs first'
  alias l='lsd -l --group-dirs first'
  alias la='lsd -a --group-dirs first'
  alias lla='lsd -la --group-dirs first'
  alias lt='lsd --tree --depth 2'
elif (( $+commands[eza] )); then
  alias ls='eza --group-directories-first --icons=auto'
  alias l='eza -l --group-directories-first --icons=auto'
  alias la='eza -a --group-directories-first --icons=auto'
  alias lla='eza -la --group-directories-first --icons=auto'
  alias lt='eza --tree --level=2 --icons=auto'
else
  [[ "$OSTYPE" == darwin* ]] && alias ls='ls -G' || alias ls='ls --color=auto'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
fi

(( $+commands[nvim] )) && alias vim='nvim' && alias v='nvim'
(( $+commands[fastfetch] )) && alias fetch='fastfetch'
alias c='clear'

mkcd() { mkdir -p -- "$1" && cd -- "$1"; }
reload() { source "${ZDOTDIR:-$HOME}/.zshrc"; }

(( $+commands[starship] )) && eval "$(starship init zsh)"

# Syntax highlighting must be the final sourced plugin.
source_first \
  "$plugin_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
  /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

unfunction source_first
unset brew_bin brew_prefix plugin_prefix
