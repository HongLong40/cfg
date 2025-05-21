#!/bin/zsh
# ZSH directory
export ZSH="/usr/share/zsh/custom"

# XDG variables.
if [[ -f ${ZSH}/xdg_vars.zsh ]]
then
    source ${ZSH}/xdg_vars.zsh
else
    export XDG_CONFIG_HOME="${HOME}/.config"
    export XDG_CACHE_HOME="${HOME}/.cache"
    export XDG_DATA_HOME="${HOME}/.local/share"
    echo "Backup path used. Could not find file to source" >| ${ZDOTDIR}/xdg_vars.txt
fi

# X11 variables
export XCOMPOSEFILE="${XDG_CONFIG_HOME}/X11/xcompose"
export XCOMPOSECACHE="${XDG_CACHE_HOME}/X11/xcompose"
export XINITRC="${XDG_CONFIG_HOME}/X11/xinitrc"

# Compilation flags
export MAKEFLAGS="-j$(nproc)"

# Disable LESSHISTFILE
export LESSHISTFILE=-

# Default editor
export EDITOR=vim
export VISUAL=vim

# Hostname
export HOSTNAME=$(</etc/hostname)

# virsh: connect to qemu:///system by default
export LIBVIRT_DEFAULT_URI="qemu:///system"

# Set language environment if it is not set
export LANG=${LANG:-en_US.UTF-8}

# Colors for ls command; enhancement for eza
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=1;35:st=37;44:ex=01;32:'
export EXA_COLORS='uu=35'

# Set misc. variables
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"   # ensures that using bat as MANPAGER renders color codes correctly
export PATH="/usr/lib/ccache/bin/:$PATH"
export USERNAME

# Write out environment variables
env | sort > ${ZDOTDIR}/env.txt

# Start X and window manager
if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]
then
    exec startx
fi
