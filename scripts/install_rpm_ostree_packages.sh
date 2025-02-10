#!/bin/bash

if [[ -n "$TOOLBOX_PATH" ]]; then
	echo "Error: Can't install rpm-ostree packages from a toolbox"
	exit 1
fi

# TODO: maybe run install_yum_repos.sh before this and include those packages?

rpm-ostree install alacritty code gammastep-indicator
