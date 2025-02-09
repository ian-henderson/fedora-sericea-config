#!/bin/bash

reload() {
	source "$BASHRC"
}

if [[ -n "$TOOLBOX_PATH" ]]; then
	fflol() {
		fastfetch "$@" | lolcat --24bit
	}
fi
