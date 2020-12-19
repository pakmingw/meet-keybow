#!/bin/sh
#
## Installation script for various keybow files, based on standard Raspbian OS deployment.
## Please review carefully before running and make local adjustments, if required.
## I'd personally copy and paste in the script components below into a shell, to be extra sure.
## This script assumes that the PI has been setup, you can ssh in, and you've cloned the github repo.

# Enable Raspbian kernel modules
echo "dwc2" | sudo tee -a /etc/modules
sudo echo "libcomposite" | sudo tee -a /etc/modules

# Deploy keys.lua, default.png, and mini_googlemeet.lua
sudo cp keys.lua /boot/keys.lua
sudo cp keybow.lua /boot/keybow.lua
sudo cp layouts/mini_googlemeet.lua /boot/layouts/mini_googlemeet.lua
sudo cp layouts/mini_googlemeet_png.lua /boot/layouts/mini_googlemeet_png.lua
sudo cp default.png /boot/default.png

# Deploy service
sudo cp keybow.service /etc/systemd/system/keybow.service
# test service
sudo systemctl start keybow.service
sudo systemctl stop keybow.service
# enable service auto-start
sudo systemctl enable keybow.service

# and reboot!