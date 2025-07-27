#!/bin/zsh

# Write out environment variables
set | rg '^X' | sort > ${ZDOTDIR}/xvars.txt
env | sort > ${ZDOTDIR}/env.txt

# Start X and window manager
if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]
then
    exec startx
fi
