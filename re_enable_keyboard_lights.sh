#!/bin/sh

OBJECT_PATH=/org/freedesktop/login1/session/$XDG_SESSION_ID
BUS_NAME=org.freedesktop.login1
UNLOCK="$OBJECT_PATH: $BUS_NAME.Session.Unlock ()"
GDBUS_MONITOR="gdbus monitor --system --dest $BUS_NAME --object-path $OBJECT_PATH"
PROGNAME=$(basename "$0")
LOGFILE=~/log/$PROGNAME.log

# ...

function log {
    echo "$(date +'%F %T.%3N') [$$]" "$@"
}

# ...

function run_daemon {
    exec &>>"$LOGFILE"
    echo 'test'

    if pgrep -f '$GDBUS_MONITOR'; then pkill '$GDBUS_MONITOR'; fi

    local signal
    while read -r signal; do
        log "$signal"
	echo $signal
        if [[ $signal == "$UNLOCK" ]]; then
		echo 'bushku' | sudo -S msiklm red,red,red,red,red,red,red
        fi
    done < $(eval "exec $GDBUS_MONITOR")
}

# ...

run_daemon
