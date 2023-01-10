export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE'fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
. "$HOME/.cargo/env"

if [ -e /home/uwu/.nix-profile/etc/profile.d/nix.sh ]; then . /home/uwu/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
