#!/bin/bash

### Home Dir ##################################################

home_dotfiles=(
	"bash_profile"
	"bashrc"
	"gitconfig"
	"inputrc"
)

for f in "${home_dotfiles[@]}"; do
	if [[ -e "$HOME/.$f" ]]; then
		rm "$HOME/.$f"
	fi

	if [[ -e "$PWD/$f" ]]; then
		ln -s "$PWD/$f" "$HOME/.$f"
	fi
done

bashrcd="$HOME/.bashrc.d"

if [[ -d "$bashrcd" ]]; then 
	rm -rf "$bashrcd"
fi

ln -s "$PWD/bashrc.d" "$bashrcd"

### Config Dir ################################################

config="$HOME/.config"

if [[ ! -d "$config" ]]; then
	mkdir -p "$config"
fi

config_dirs=(
	"fastfetch"
	"foot"
	"gammastep"
	"gtk-3.0"
	"nvim"
	"sway"
)

for d in "${config_dirs[@]}"; do
	if [[ -d "$config/$d" ]]; then
		rm -rf "$config/$d"
	fi

	if [[ -d "$PWD/$d" ]]; then
		ln -s "$PWD/$d" "$config/$d"
	fi
done
