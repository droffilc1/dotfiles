# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_THEME="robbyrussell"

plugins=(
git
archlinux
zsh-autosuggestions
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
#pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw
# --logo-height 10 --logo-width 5 --logo -

# fastfetch. Will be disabled if above colorscript was chosen to install
# fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

pomodoro () {
if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
val=$1
echo "$val" | lolcat
timer "${pomo_options["$val"]}"m
spd-say "$val session done"
fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"
# Set-up icons for files/folders in terminal
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias v='nvim'
alias ns='NVIM_APPNAME="nvim-start" nvim'
alias ne='NVIM_APPNAME="nvimexample" nvim'
alias nt='NVIM_APPNAME="nvim-test" nvim'
alias pn=pnpm

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt CORRECT

# pnpm
export PNPM_HOME="/home/cliff/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$PATH:$HOME/.dotnet"
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/home/cliff/.spicetify

fpath=(~/.zsh/completions $fpath)
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

export PATH="$PATH:$HOME/.config/hypr/scripts"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/share/../bin/env"

# Created by `pipx` on 2025-10-22 20:39:10
export PATH="$PATH:/home/cliff/.local/bin"
