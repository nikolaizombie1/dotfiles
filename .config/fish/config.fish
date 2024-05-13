fish_vi_key_bindings
starship init fish | source
alias ls="exa --icons -s=changed -T -L 1 --group-directories-first"
alias la="exa --icons -s=changed -T -L 1 --group-directories-first -a"
alias ll="exa -lma -s=changed --icons"
alias waifu2x="waifu2x-ncnn-vulkan"
alias c='clear'
alias doom="~/./.config/emacs/bin/doom"
alias wd="wakeonlan 44:8A:5B:CE:75:8A"
alias vim="nvim"
alias mktex="rm *.out *.toc *.aux *.log *.pdf *.blg *.bbl ; pdflatex --synctex=1 *.tex && bibtex *.aux && pdflatex --synctex=1 *.tex ; pdflatex --synctex=1 *.tex"
alias mktexsvg="rm *.out *.toc *.aux *.log *.pdf *.blg *.bbl ; pdflatex --shell-escape *.tex --synctex=1 && bibtex *.aux && pdflatex --shell-escape *.tex ; pdflatex --shell-escape --synctex=1 *.tex"

set fish_greeting
set PATH $PATH "/var/lib/snapd/snap/bin"
set PATH $PATH "/usr/sbin"
set PATH $PATH $HOME"/.cargo/bin/"
set PATH $PATH $HOME"/Scripts"
set PATH $PATH $HOME"/.local/bin/"
set PATH $PATH $HOME"/.julia/bin"
set PATH $PATH "/usr/local/go/bin"
set -gx DEBUGINFOD_URLS 'https://debuginfod.archlinux.org'
set -gx GTK_IM_MODULE 'fcitx'
set -gx QT_IM_MODULE 'fcitx'
set -gx SDL_IM_MODULE 'fcitx'
set -gx XMODIFIERS '@im=fcitx'
#set -gx XDG_CONFIG_HOME "~/.config/"
set -gx GTK_THEME 'Sweet-Dark-v40'
set -gx GTK_THEME 'Sweet-Dark-v40'
#set -gx HOSTNAME (hostname)
set -gx UGIT "ssh -i $HOME/.ssh/id_ed25519_university -o IdentitiesOnly=yes"
set -gx PGIT "ssh -i $HOME/.ssh/id_ed25519_personal -o IdentitiesOnly=yes"
set -gx PIXELINK_SDK_INC $HOME"/PixeLINKSdk/include"
set -gx PIXELINK_SDK_LIB $HOME"/PixeLINKSdk/lib"
set -gx LD_LIBRARY_PATH $PIXELINK_SDK_LIB

if status --is-interactive;
    keychain --nogui --clear ~/.ssh/id_ed25519_personal ~/.ssh/id_ed25519_university -q
    [ -e $HOME/.keychain/$HOSTNAME-fish ]; and source $HOME/.keychain/$HOSTNAME-fish
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/gram/.ghcup/bin # ghcup-env
