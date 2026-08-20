#!/bin/sh
#ref: https://docs.voidlinux.org/config/media/pipewire.html

#installing pipewire (also installs wireplumber, a session manager)
sudo xbps-install -S pipewire

#configuring pipewire to launch wireplumber directly
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/

#giving it a pulseaudio interface
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

#to test run 'pipewire'

#getting it to launch on startup (for KDE)
mkdir -p ~/.config/autostart
cat >~/.config/autostart/pipewire.desktop <<'EOF'
[Desktop Entry]
Type=Application
Name=PipeWire
Exec=sh -c "pipewire &"
X-GNOME-Autostart-enabled=true
EOF
