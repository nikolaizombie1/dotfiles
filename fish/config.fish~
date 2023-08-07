if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_vi_key_bindings
starship init fish | source
complete -c alacritty -n "__fish_use_subcommand" -l embed -d 'X11 window ID to embed Alacritty within (decimal or hexadecimal with "0x" prefix)' -r
complete -c alacritty -n "__fish_use_subcommand" -l config-file -d 'Specify alternative configuration file [default: $XDG_CONFIG_HOME/alacritty/alacritty.yml]' -r -F
complete -c alacritty -n "__fish_use_subcommand" -l socket -d 'Path for IPC socket creation' -r -F
complete -c alacritty -n "__fish_use_subcommand" -s o -l option -d 'Override configuration file options [example: cursor.style=Beam]' -r
complete -c alacritty -n "__fish_use_subcommand" -l working-directory -d 'Start the shell in the specified working directory' -r -F
complete -c alacritty -n "__fish_use_subcommand" -s e -l command -d 'Command and args to execute (must be last argument)' -r
complete -c alacritty -n "__fish_use_subcommand" -s T -l title -d 'Defines the window title [default: Alacritty]' -r
complete -c alacritty -n "__fish_use_subcommand" -l class -d 'Defines window class/app_id on X11/Wayland [default: Alacritty]' -r
complete -c alacritty -n "__fish_use_subcommand" -s h -l help -d 'Print help information'
complete -c alacritty -n "__fish_use_subcommand" -s V -l version -d 'Print version information'
complete -c alacritty -n "__fish_use_subcommand" -l print-events -d 'Print all events to stdout'
complete -c alacritty -n "__fish_use_subcommand" -l ref-test -d 'Generates ref test'
complete -c alacritty -n "__fish_use_subcommand" -s q -d 'Reduces the level of verbosity (the min level is -qq)'
complete -c alacritty -n "__fish_use_subcommand" -s v -d 'Increases the level of verbosity (the max level is -vvv)'
complete -c alacritty -n "__fish_use_subcommand" -l hold -d 'Remain open after child process exit'
complete -c alacritty -n "__fish_use_subcommand" -f -a "msg" -d 'Send a message to the Alacritty socket'
complete -c alacritty -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c alacritty -n "__fish_seen_subcommand_from msg; and not __fish_seen_subcommand_from create-window; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from help" -s s -l socket -d 'IPC socket connection path override' -r -F
complete -c alacritty -n "__fish_seen_subcommand_from msg; and not __fish_seen_subcommand_from create-window; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help information'
complete -c alacritty -n "__fish_seen_subcommand_from msg; and not __fish_seen_subcommand_from create-window; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from help" -f -a "create-window" -d 'Create a new window in the same Alacritty process'
complete -c alacritty -n "__fish_seen_subcommand_from msg; and not __fish_seen_subcommand_from create-window; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from help" -f -a "config" -d 'Update the Alacritty configuration'
complete -c alacritty -n "__fish_seen_subcommand_from msg; and not __fish_seen_subcommand_from create-window; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c alacritty -n "__fish_seen_subcommand_from msg; and __fish_seen_subcommand_from create-window" -l working-directory -d 'Start the shell in the specified working directory' -r -F
complete -c alacritty -n "__fish_seen_subcommand_from msg; and __fish_seen_subcommand_from create-window" -s e -l command -d 'Command and args to execute (must be last argument)' -r
complete -c alacritty -n "__fish_seen_subcommand_from msg; and __fish_seen_subcommand_from create-window" -s T -l title -d 'Defines the window title [default: Alacritty]' -r
complete -c alacritty -n "__fish_seen_subcommand_from msg; and __fish_seen_subcommand_from create-window" -l class -d 'Defines window class/app_id on X11/Wayland [default: Alacritty]' -r
complete -c alacritty -n "__fish_seen_subcommand_from msg; and __fish_seen_subcommand_from create-window" -l hold -d 'Remain open after child process exit'
complete -c alacritty -n "__fish_seen_subcommand_from msg; and __fish_seen_subcommand_from create-window" -s h -l help -d 'Print help information'
complete -c alacritty -n "__fish_seen_subcommand_from msg; and __fish_seen_subcommand_from config" -s w -l window-id -d 'Window ID for the new config' -r
complete -c alacritty -n "__fish_seen_subcommand_from msg; and __fish_seen_subcommand_from config" -s r -l reset -d 'Clear all runtime configuration changes'
complete -c alacritty -n "__fish_seen_subcommand_from msg; and __fish_seen_subcommand_from config" -s h -l help -d 'Print help information'

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
set -gx HOSTNAME (hostname)
set -gx UGIT "ssh -i $HOME/.ssh/id_ed25519_university -o IdentitiesOnly=yes"
set -gx PGIT "ssh -i $HOME/.ssh/id_ed25519_personal -o IdentitiesOnly=yes"
function ugit_clone
    GIT_SSH_COMMAND="ssh -i $HOME/.ssh/id_ed25519_university -o IdentitiesOnly=yes" git clone $argv
end

if status --is-interactive;
    keychain --nogui --clear ~/.ssh/id_ed25519_personal ~/.ssh/id_ed25519_university -q
    [ -e $HOME/.keychain/$HOSTNAME-fish ]; and source $HOME/.keychain/$HOSTNAME-fish
end

#Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
