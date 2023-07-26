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
alias doom="~/./.config/emacs/bin/doom"
alias wd="wakeonlan 44:8A:5B:CE:75:8A"
alias vim="nvim"
alias mktex="rm *.out *.toc *.aux *.log *.pdf *.blg *.bbl ; pdflatex --synctex=1 *.tex && bibtex *.aux && pdflatex --synctex=1 *.tex ; pdflatex --synctex=1 *.tex"
alias mktexsvg="rm *.out *.toc *.aux *.log *.pdf *.blg *.bbl ; pdflatex --shell-escape *.tex --synctex=1 && bibtex *.aux && pdflatex --shell-escape *.tex ; pdflatex --shell-escape --synctex=1 *.tex"

set PATH $PATH "/var/lib/snapd/snap/bin"
set PATH $PATH "/usr/sbin"
set PATH $PATH "~/.cargo/bin/"
set PATH $PATH $HOME"/Scripts"
set PATH $PATH $HOME"/.julia/bin"
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
