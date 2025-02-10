#!/bin/bash

if [[ -n "$TOOLBOX_PATH" ]]; then
	echo "Can't toggle theme from toolbox"
	exit 1
fi

variables="$HOME/.bashrc.d/variables.sh"

if [[ -e "$variables" ]]; then
	source "$variables"
fi

theme_file="$SYSTEM_CONFIG/theme"

if [[ -e "$theme_file" ]]; then
	read theme < "$theme_file"
fi

# TODO: test default values
if [[ "$theme" == "dark" ]]; then
	alacritty_theme="${ALACRITTY_THEME_DARK:-catppuccin_mocha}"
	gtk_theme="${GTK_THEME_DARK:-Adwaita-dark}"
	icon_theme="${ICON_THEME_DARK:-Adwaita-dark}"
	prefer_dark_theme="true"
else
	alacritty_theme="${ALACRITTY_THEME_LIGHT:-catppuccin_latte}"
	gtk_theme="${GTK_THEME_LIGHT:-Adwaita}"
	icon_theme="${ICON_THEME_LIGHT:-Adwaita}"
	prefer_dark_theme="false"
fi

# Alacritty

alacritty="$HOME/.config/alacritty"
alacritty_config="$alacritty/alacritty.toml"
alacritty_themes="$alacritty/themes"
theme_file="$alacritty_themes/$alacritty_theme.toml"

if [[ -e "$alacritty_config" ]] && [[ -e "$theme_file" ]]; then
	sed -i "s|^import.*=.*|import = [ \"$theme_file\" ]|" "$alacritty_config"
fi

# GTK

gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
gsettings set org.gnome.desktop.interface icon-theme "$icon_theme"

gtk3_settings="$HOME/.config/gtk-3.0/settings.ini"

if [[ -e "$gtk3_settings" ]]; then
	sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$gtk_theme/" "$gtk3_settings"
	sed -i "s/^gtk-icon-name=.*/gtk-icon-name=$icon_theme/"	"$gtk3_settings"
	sed -i "s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=$prefer_dark_theme/" "$gtk3_settings"
fi
