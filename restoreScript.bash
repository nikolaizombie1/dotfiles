#!/usr/bin/env bash

cp redshift.conf ~/.config/
cp -r doom ~/.config/
cp -r awesome ~/.config/
cp .bashrc ~/
cp .zshenv ~/
cp .zshrc ~/
cp alacritty.yml ~/
cp starship.toml ~/.config/
cp .xinitrc ~/
cp -r fish ~/.config/
cp -r wireplumber ~/.config/
cp .gitconfig ~/
cp mimeapps.list ~/.local/share/applications/
sudo mkdir -p "/etc/systemd/system/getty@tty1.service.d/" && sudo cp autologin.conf /etc/systemd/system/getty@tty1.service.d/ && sudo systemctl daemon-reload && sudo systemctl enable getty@tty1.service
sudo apt update && sudo apt upgrade && sudo apt install nala -y && cat base_packages.txt | xargs sudo nala install -y
