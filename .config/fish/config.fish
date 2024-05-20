fish_vi_key_bindings
starship init fish | source
alias ls="exa --icons -s=changed -T -L 1 --group-directories-first"
alias la="exa --icons -s=changed -T -L 1 --group-directories-first -a"
alias ll="exa -lma -s=changed --icons"
alias vim="nvim"

set fish_greeting
set PATH $PATH $HOME"/.cargo/bin/"
set PATH $PATH $HOME"/.local/bin/"
set PATH $PATH "/usr/local/go/bin"

if status --is-interactive;
    keychain --nogui --clear ~/.ssh/id_ed25519_personal -q
    [ -e $HOME/.keychain/$HOSTNAME-fish ]; and source $HOME/.keychain/$HOSTNAME-fish
end