#!/bin/zsh

typeset PROGNAME=$(basename $0)
typeset PIDFILE="/tmp/polybar_hlwm_handle_events.pid"

# check if script is already running
if [[ -f $PIDFILE ]]
then
    if pgrep -F $PIDFILE > /dev/null
    then
        pid=$(<${PIDFILE})
        echo "[$(date)] : $PROGNAME: Process is already running with PID $pid"
        return 1
    fi
fi

# create pid file
echo $$ > $PIDFILE


TRAPHUP TRAPTERM() {
        echo "[$(date)] : $PROGNAME stopped" >> /tmp/${PROGNAME}.log
        rm -f $PIDFILE
        exit 0
}

herbstclient --idle | {

    while read -A event
    do
        if [[ ${event[1]} == "attribute_changed" ]]
        then
            polybar-msg action "#layout.hook.0" 1> /dev/null  2>&1
        fi

        if [[ ${event[1]} =~ "tag_" ]]
        then
            polybar-msg action "#workspaces.hook.0" 1> /dev/null  2>&1
        fi
    done

} 2>/dev/null

rm -f $PIDFILE

