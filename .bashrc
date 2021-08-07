# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
#export PS1="\[$(tput bold)\]\[\033[38;5;201m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;33m\]\t\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;39m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;9m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]"
eval "$(starship init bash)"
