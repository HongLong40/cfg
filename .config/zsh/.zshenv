#!/bin/zsh
# XDG variables.
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

# ZSH directory
export ZSH="/usr/share/zsh/custom"

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

# Modify colors for eza command
export EZA_COLORS='uu=35'       # display user in purple text

# Set misc. variables
export BC_ENV_ARGS="${XDG_CONFIG_HOME}/bc/bcrc"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"          # ensures that MANPAGER renders color codes correctly
export PATH="/usr/lib/ccache/bin/:$PATH"
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/rg/ripgreprc"
export USERNAME
