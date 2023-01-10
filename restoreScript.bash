#!/usr/bin/env bash

cp redshift.conf ~/.config/
cp -r .doom.d ~/
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
sudo mkdir -p "/etc/systemd/system/getty@tty1.service.d/" && sudo cp autologin.conf /etc/systemd/system/getty@tty1.service.d/ && sudo systemctl daemon-reload && sudo systemctl enable getty@tty1.service
