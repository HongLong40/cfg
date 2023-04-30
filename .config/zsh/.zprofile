#!/bin/zsh

# set XDG variables.
# source: https://wiki.archlinux.org/index.php/XDG_Base_Directory

export XDG_CONFIG_HOME="${HOME}/.config" 
export XDG_CACHE_HOME="${HOME}/.cache" 
export XDG_DATA_HOME="${HOME}/.local/share" 

# export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZSH="/usr/share/zsh/custom"

# History
export HISTFILE="${ZDOTDIR}/.zhistory"    # History filepath
export HISTSIZE=50000
export SAVEHIST=10000

export XCOMPOSEFILE="${XDG_CONFIG_HOME}/X11/xcompose"
export XINITRC="${XDG_CONFIG_HOME}/X11/xinitrc"

export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/rg/ripgreprc"

# Compilation flags
# lscpu | awk 'BEGIN { l=j=1 } /(Core|Thread)\(s\)/ { l=l*$NF } END { j=l+1; print "-j"j,"-l"l }'
export MAKEFLAGS="-j$(nproc)"

# disable LESSHISTFILE
export LESSHISTFILE=-

# default editor
export EDITOR=vim
export VISUAL=vim

# hostname
export HOSTNAME=$(</etc/hostname)

# virsh: connect to qemu:///system by default
export LIBVIRT_DEFAULT_URI="qemu:///system"

# Set language environment if it is not set
export LANG=${LANG:-en_US.UTF-8}

# set colors for ls command
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=1;35:st=37;44:ex=01;32:'
export EXA_COLORS='uu=35'

# Set misc. variables
export BC_ENV_ARGS=${HOME}/.config/bc/bcrc
export PATH="/usr/lib/ccache/bin/:$PATH"
export USERNAME
export MANPAGER="sh -c 'col -bx | bat -l man -p'"


# write out environment variables
env | sort > ${ZDOTDIR}/env.txt

# start X and window manager
if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]
then
    exec startx ${XDG_CONFIG_HOME}/X11/xinitrc
fi
