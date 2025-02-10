#!/bin/bash

if [[ -z "$TOOLBOX_PATH" ]]; then
	echo "Error: Can't access dnf from outside of toolbox"
	exit 1
fi

dnf_conf="/etc/dnf/dnf.conf"

if [[ -e "$dnf_conf" ]]; then
	sudo rm "$dnf_conf"
fi

sudo ln -s "$PWD/../dnf.conf" "$dnf_conf"

sudo dnf upgrade -y

sudo dnf install -y \
	awscli2 \
	bat \
	btop \
	curl \
	fastfetch \
	git \
	lolcat \
	neovim \
	tree \
	wget
