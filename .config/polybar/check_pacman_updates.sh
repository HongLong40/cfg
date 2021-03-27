#!/bin/zsh

# check if script is already running
for pid in $(pidof -x check_pacman_updates.sh)
do
    if [[ $pid != $$ ]]
    then
        echo "[$(date)] : check_pacman_updates.sh : Process is already running with PID $pid"
        exit 1
    fi
done

# Defaults
typeset CONFIG=$HOME/.config/polybar/check_pacman_updates.config 
typeset LOG=$HOME/.config/polybar/check_pacman_updates.log

# define write_log function
write_log() { echo $(date "+%Y-%m-%d %T") "$@" >> $LOG }

# initialize log
rm -f $LOG
write_log "Starting $0 with PID = $$"

# load parameters
typeset -A pbc
pbc=( $(<$CONFIG) )

write_log "Polling Interval = ${pbc[poll_interval]}"

# define tracking variables
typeset -i last_update_count=-1
typeset -i curr_update_count=0
typeset -i counter=1

# Wait for 15s, as polybars need to start up
while [[ (! -f /tmp/polybar_started) && $counter -le 15 ]]
do
    echo file not found $counter
    sleep 1
    (( counter++ ))
done

# infinite loop: get updates count, update polybar, sleep until next cycle
while true
do
    curr_update_count=$(checkupdates 2> /dev/null | wc -l | tee /tmp/pacman_updates.count)
    
    write_log "Current Update Count: ..$curr_update_count.."
    
    #echo $(date "+%Y-%m-%d %T") Current Update Count: ..$curr_update_count.. >> $LOG
    if [[ ($last_update_count -ne $curr_update_count) ]]
    then
        last_update_count=$curr_update_count
        polybar-msg hook ${pbc[hook_name]} ${pbc[hook_id]} || true
        dunstify -t 5000 "$curr_update_count New Pacman Updates Available"
    fi

    sleep ${pbc[poll_interval]}
done

# vim:ft=zsh:

