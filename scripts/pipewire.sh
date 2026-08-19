#!/bin/sh

sudo xbps-install -S pipewire

#connecting to wireplumber
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

#enabling as a service
sudo mkdir -p ~/.config/service
sudo ln -s /etc/sv/pipewire ~/.config/service/
sudo ln -s /etc/sv/wireplumber ~/.config/service/
sudo ln -s /etc/sv/pipewire-pulse ~/.config/service/

#adding bluetooth support
sudo xbps-install -Sy libspa-bluetooth
