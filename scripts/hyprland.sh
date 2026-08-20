#!/bin/sh

#adding repo
sudo cp /usr/share/xbps.d/00-repository-main.conf /etc/xbps.d/
sudo sed -i "1i repository=https://mirror.black-hole.dev/$(xbps-uhelper arch)" /etc/xbps.d/00-repository-main.conf

#sync
sudo xbps-install -S

#packages
sudo xbps-install -S hyprland hyprland-devel xdg-desktop-portal-hyprland
sudo xbps-install -S seatd polkit-kde-agent kitty waybar wofi swaybg

#enabling seatd as a service
sudo ln -s /etc/sv/seatd /var/service
sudo usermod -aG _seatd $USER
