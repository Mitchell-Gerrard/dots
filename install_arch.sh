#!/bin/bash

sudo pacman -Syu
sudo pacman -S i3-wm i3status alacritty picom python python-pip feh ttf-font-awesome google-chrome rofi

cd ~/Pictures
git init
git remote add origin https://github.com/mitchyman2011/Wallpapers.git
git pull origin master
cd ../dots
ln -sf ~/dots/i3 ~/.config/i3
ln -sf ~/dots/alacritty ~/.config/alacritty
ln -sf ~/dots/picom ~/.config/picom
ln -sf ~/dots/.bashrc ~/.bashrc
cd ~/.config/i3
git clone https://aur.archlinux.org/bumblebee-status.git
cd bumblebee-status
sudo pacman -S base-devel
makepkg -sicr
pip install --user bumblebee-status
cd ~/dots
cat crontab | crontab -


