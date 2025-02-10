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
export FONTS="$HOME/.fonts"
export ICONS="$HOME/.icons"
export SWAY="$CONFIG/sway"
export SYSTEM_CONFIG="$DEVELOPER/system_config"
export THEMES="$HOME/.themes"
export VARIABLES="$BASHRCD/variables.sh"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"

# Fonts
export MONOSPACE_FONT="Fira Mono"
export SANS_SERIF_FONT="Fira Sans"
export GTK_FONT_SIZE="12"
export SWAY_FONT_SIZE="11"
export TERMINAL_FONT_SIZE="18"

# Themes/Icons
export ALACRITTY_THEME_DARK="catppuccin_mocha"
export ALACRITTY_THEME_LIGHT="catppuccin_latte"
export GTK_THEME_DARK="Adwaita-dark"
export GTK_THEME_LIGHT="Adwaita"
export ICON_THEME_DARK="Papirus-Dark"
export ICON_THEME_LIGHT="Papirus"
