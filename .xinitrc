sleep 0.5
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) awesome
#exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) cinnamon-session
