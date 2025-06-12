export ZSH="$HOME/.oh-my-zsh"

plugins=(git history-substring-search zsh-completions zsh-syntax-highlighting zsh-autosuggestions)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh
alias vim="nvim"


export PATH="$PATH/home/hoainam/.local/bin"
eval "$(starship init zsh)"

export PATH="$PATH/home/hoainam/.spicetify"
export JAVA_HOME="$JAVA_HOME/usr/lib/jvm/java-21-openjdk/"
