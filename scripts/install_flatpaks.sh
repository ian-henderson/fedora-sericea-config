#!/bin/bash

if [[ -n "$TOOLBOX_PATH" ]]; then
	echo "Error: Can't install flatpaks from a toolbox"
	exit 1
fi

flatpak remote-delete fedora

flatpak remote-add --if-not-exists \
	flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y \
	ca.desrt.dconf-editor \
	ch.protonmail.protonmail-bridge \
	com.calibre_ebook.calibre \
	com.github.johnfactotum.Foliate \
	com.github.tchx84.Flatseal \
	com.jetbrains.RustRover \
	com.protonvpn.www \
	de.haeckerfelix.Shortwave \
	io.missioncenter.MissionCenter \
	me.timschneeberger.GalaxyBudsClient \
	org.gnome.Boxes \
	org.gnome.Evince \
	org.gnome.Papers \
	org.gnome.baobab \
	org.mozilla.firefox \
	org.mozilla.Thunderbird \
	org.signal.Signal \
	us.zoom.Zoom
