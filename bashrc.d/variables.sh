#!/bin/bash

# General
if [[ -n "$TOOLBOX_PATH" ]]; then
	export EDITOR="nvim"
else
	export EDITOR="vi"
fi

# Directories
export ALIASES="$BASHRCD/aliases.sh"
export AWS="$HOME/.aws"
export BASHRC="$HOME/.bashrc"
export BASHRCD="$HOME/.bashrc.d"
export CONFIG="$HOME/.config"
export DEVELOPER="$HOME/Developer"
export FEDORA_SERICEA_CONFIG="$DEVELOPER/fedora-sericea-config"
export FONTS="$HOME/.fonts"
export ICONS="$HOME/.icons"
export SWAY="$CONFIG/sway"
export THEMES="$HOME/.themes"
export VARIABLES="$BASHRCD/variables.sh"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"

# Fonts
export MONOSPACE_FONT="Ubuntu Sans Mono"
export SANS_SERIF_FONT="Ubuntu Sans"
export GTK_FONT_SIZE="14"
export SWAY_FONT_SIZE="11"
export TERMINAL_FONT_SIZE="18"

# Themes/Icons
export ALACRITTY_THEME_DARK="catppuccin_mocha"
export ALACRITTY_THEME_LIGHT="catppuccin_latte"
export GTK_THEME_DARK="Adwaita-dark"
export GTK_THEME_LIGHT="Adwaita"
export ICON_THEME_DARK="Papirus-Dark"
export ICON_THEME_LIGHT="Papirus"
