#!/bin/bash

if [[ -n "$TOOLBOX_PATH" ]]; then
	echo "Can't set wallpaper from toolbox"
	exit 1
fi

wallpapers="/home/ian/Pictures/Wallpapers"
dark_wallpapers="$wallpapers/Dark"
light_wallpapers="$wallpapers/Light"

if [[ ! -d "$dark_wallpapers" ]]; then
	mkdir -p "$dark_wallpapers"
fi

if [[ ! -d "$light_wallpapers" ]]; then
	mkdir -p "$light_wallpapers"
fi

hour=$(date +"%H")

if [ "$hour" -ge 16 ] || [ "$hour" -lt 8 ]; then
	wallpaper=$(find "$dark_wallpapers" -type f | shuf -n1)
else
	wallpaper=$(find "$light_wallpapers" -type f | shuf -n1)
fi

pkill swaybg
swaybg -i "$wallpaper" -m fill &

swaylock="$HOME/.config/swaylock"

if [[ ! -d "$swaylock" ]]; then
	cp -r "/etc/swaylock" "$HOME/.config"
fi

sed -i "s|^image=.*|image=$wallpaper|" "$swaylock/config"
