#/bin/sh

rfkill unblock bluetooth

sudo xbps-install -S bluez
sudo ln -s /etc/sv/bluetoothd /var/service/
sudo ln -s /etc/sv/dbus /var/service/

sudo usermod -aG bluetooth $USER

sudo sv restart dbus

# (IMPORTANT) if restarting dbus kills your wifi run the following command alone
# sudo sv restart NetworkManager
