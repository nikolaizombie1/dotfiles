#!/usr/bin/env bash

cp ~/.config/redshift.conf .
cp -r ~/.doom.d .
cp -r ~/.config/awesome .
cp ~/.bashrc .
cp ~/.zshenv .
cp ~/.zshrc .
cp ~/alacritty.yml .
cp ~/.config/starship.toml .
cp ~/.xinitrc .

if git pull; then
    git commit -a -m "$1"
    git push
fi
