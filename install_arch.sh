#!/bin/bash


sudo pacman -S i3-wm i3status alacritty picom python feh ttf-font-awesome
cd ~
git clone https://github.com/mitchyman2011/dots.git
cd Documents
git clone https://github.com/mitchyman2011/University.git

cd /~/Pictures
git remote add origin https://github.com/mitchyman2011/Wallpapers.git
cd ../dots
ln -s ~/dots/i3 ~/.config/i3
ln -s ~/dots/alacritty ~/.config/alacritty
ln -s ~/dots/picom ~/.config/picom
cd ~/.config/i3
git clone https://aur.archlinux.org/bumblebee-status.git
cd bumblebee-status
sudo pacman -S base-devel
makepkg -sicr
pip install --user bumblebee-status
cat crontab | crontab -


