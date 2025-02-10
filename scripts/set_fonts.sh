#!/bin/bash

if [[ -n "$TOOLBOX_PATH" ]]; then
        echo "Error: Can't set fonts from a toolbox"
        exit 1
fi

variables="$HOME/.bashrc.d/variables.sh"
if [[ -e "$variables" ]]; then
	source "$variables"
fi

# Alacritty Font
alacritty_config="$HOME/.config/alacritty/alacritty.toml"
if [[ -n "$MONOSPACE_FONT" ]] && [[ -n "$TERMINAL_FONT_SIZE" ]] && [[ -e "$alacritty_config" ]]; then
	sed -i "s/^normal = { family = \".*\" }/normal = { family = \"$MONOSPACE_FONT\" }/" "$alacritty_config"
	sed -i "s/^size = .*/size = $TERMINAL_FONT_SIZE/" "$alacritty_config"
fi

# Foot Font
foot_config="$HOME/.config/foot/foot.ini"
if [[ -n "$MONOSPACE_FONT" ]] && [[ -n "$TERMINAL_FONT_SIZE" ]] && [[ -e "$foot_config" ]]; then
	sed -i "s/^font = .*/font = $MONOSPACE_FONT:size=$TERMINAL_FONT_SIZE/" "$foot_config"
fi

# GTK Font
if [[ -n "$SANS_SERIF_FONT" ]] && [[ -n "$GTK_FONT_SIZE" ]]; then
	font_name="$SANS_SERIF_FONT $GTK_FONT_SIZE"

	gsettings set org.gnome.desktop.interface font-name "$font_name"

	gtk3_settings="$HOME/.config/gtk-3.0/settings.ini"

	if [[ -f "$gtk3_settings" ]]; then
		sed -i "s/^gtk-font-name=.*/gtk-font-name=$font_name/" "$gtk3_settings"
	fi
fi

# Sway Font
sway_config="$HOME/.config/sway/config"
if [[ -n "$MONOSPACE_FONT" ]] && [[ -n "$SWAY_FONT_SIZE" ]] && [[ -e "$sway_config" ]]; then
	font_name="$MONOSPACE_FONT $SWAY_FONT_SIZE"

	sed -i "s/^font pango:.*/font pango:$font_name/" "$sway_config"
fi
