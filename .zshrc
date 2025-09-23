HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep extendedglob nomatch notify

zstyle :compinstall filename '$HOME/.zshrc'
export PATH="$PATH:$HOME/go/bin"

fpath=(~/.zsh/zsh-completions $fpath)

autoload -Uz compinit
compinit

alias ls="lsd -F"

bindkey -e
bindkey "^[[3~" delete-char

chpwd() { :; }
cd "$HOME"
sleep 0.1
fastfetch

eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
