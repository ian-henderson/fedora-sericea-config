#!/bin/bash

if [[ -n "$TOOLBOX_PATH" ]]; then
	echo "Error: Can't access /etc/yum.repos.d/ from a toolbox. Exiting."
	exit 1
fi

for repo in "$PWD/yum.repos.d"/*; do
	target="/etc/yum.repos.d/$(basename "$repo")"

	if [[ -e "$target" ]]; then
		sudo rm "$target"
	fi

	sudo ln -s "$repo" "$target"
done
