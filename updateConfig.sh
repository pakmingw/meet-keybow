#!/bin/sh
# Script to deploy keys.lua, default.png, and key configs
sudo cp keys.lua /boot/keys.lua
sudo cp keybow.lua /boot/keybow.lua
sudo cp layouts/mini_googlemeet.lua /boot/layouts/mini_googlemeet.lua
sudo cp layouts/mini_googlemeet_png.lua /boot/layouts/mini_googlemeet_png.lua
sudo cp default.png /boot/default.png