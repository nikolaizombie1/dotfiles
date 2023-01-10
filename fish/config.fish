if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_vi_key_bindings
starship init fish | source

alias ls="exa --icons -s=changed -T -L 1 --group-directories-first"
alias la="exa --icons -s=changed -T -L 1 --group-directories-first -a"
alias ll="exa -lma -s=changed --icons"
alias waifu2x="waifu2x-ncnn-vulkan"
alias Music="cd /home/uwu/Linux-Storage/Downloads/Music/"
alias c='clear'
alias doom="~/./.emacs.d/bin/doom"
alias wd="wakeonlan 44:8A:5B:CE:75:8A"
alias vim="nvim"

set PATH $PATH "/var/lib/snapd/snap/bin"
set PATH $PATH "/usr/sbin"
set PATH $PATH "~/.cargo/bin/"
set -gx DEBUGINFOD_URLS 'https://debuginfod.archlinux.org'
set -gx GTK_IM_MODULE 'fcitx'
set -gx QT_IM_MODULE 'fcitx'
set -gx SDL_IM_MODULE 'fcitx'
set -gx XMODIFIERS '@im=fcitx'
#set -gx XDG_CONFIG_HOME "~/.config/"
set -gx GTK_THEME 'Sweet-Dark-v40'
set -gx GTK_THEME 'Sweet-Dark-v40'
keychain --eval (command ls ~/.ssh/ | awk '/^id[_a-z0-9]*$/') -q | source
. /home/uwu/.nix-profile/etc/profile.d/nix.fish

#Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
