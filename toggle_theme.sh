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

if [[ "$theme" == "dark" ]]; then
	echo "light" > "$theme_file"
	prefer_dark_theme="false"
	gtk_theme="${GTK_THEME_LIGHT:-Adwaita}"
	icon_theme="${ICON_THEME_LIGHT:-Adwaita}"
else
	echo "dark" > "$theme_file"
	prefer_dark_theme="true"
	gtk_theme="${GTK_THEME_DARK:-Adwaita-dark}"
	icon_theme="${ICON_THEME_DARK:-Adwaita-dark}"
fi

gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
gsettings set org.gnome.desktop.interface icon-theme "$icon_theme"

gtk3_settings="$HOME/.config/gtk-3.0/settings.ini"

if [[ -e "$gtk3_settings" ]]; then
	sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$gtk_theme/" "$gtk3_settings"
	sed -i "s/^gtk-icon-name=.*/gtk-icon-name=$icon_theme/"	"$gtk3_settings"
	sed -i "s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=$prefer_dark_theme/" "$gtk3_settings"
fi
