#!/bin/bash

source $HOME/.bashrc.d/variables.sh

# host system
if [[ -z "$TOOLBOX_PATH" ]]; then
	alias f=flatpak
fi

# toolbox only
if [[ -n "$TOOLBOX_PATH" ]]; then
	alias cat="bat -pp --tabs 8 --theme ansi"
	alias d="sudo dnf"
	alias g=git
	alias vi=nvim
fi

alias ff=fastfetch
alias elitebook="ssh ian@elitebook"
alias raspberrypi="ssh ian@raspberrypi"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -lah"
alias la="ls -lAh"
alias ll="ls -lh"
alias ls="ls --color=auto"
alias lsa="ls -lah"

