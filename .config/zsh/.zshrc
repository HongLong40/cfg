#!/bin/zsh

fpath=("$ZSH" "$fpath[@]")
autoload -Uz promptinit add-zsh-hook
promptinit

# -------------------------------
# autoload custom functions
# -------------------------------
local -a aufn=( $(<${ZSH}/autoload) )
autoload -Uz ${aufn}
unset aufn

# add hook to set terminal title
add-zsh-hook precmd set_terminal_title_precmd

# -------------------------------
# completions (minimalist setup)
# -------------------------------
zmodload zsh/complist
autoload -U compinit; compinit

setopt COMPLETE_IN_WORD

zstyle ':completion:*' completer _complete
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# -------------------------------
# aliases and directories
# -------------------------------
source ${ZSH}/aliases.zsh
source ${ZSH}/directories.zsh

# -------------------------------
# history
# -------------------------------
HISTFILE="${XDG_CACHE_HOME}/zsh_history"    # History filepath
HISTSIZE=50000
SAVEHIST=$HISTSIZE
HISTORY_IGNORE="(ls|ls *|ll|ll *|cd*|cls|exit|poweroff|reboot)"

setopt extended_history                # record timestamp of command in HISTFILE
setopt hist_expire_dups_first          # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups            # Remove all earlier occurrences of a command when it's re-entered
setopt hist_ignore_space               # ignore commands that start with space
setopt hist_verify                     # show command with history expansion to user before running it
setopt share_history                   # share command history data

# -------------------------------
# key bindings
# -------------------------------
# Use vi-mode key bindings
bindkey -v
export KEYTIMEOUT=5

# Movement
bindkey "^[[H" beginning-of-line       # [Home]
bindkey "^[[F" end-of-line             # [End]
bindkey '^[[1;5C' forward-word         # [Ctrl-RightArrow]
bindkey '^[[1;5D' backward-word        # [Ctrl-LeftArrow]

# Deletions
bindkey "^H" backward-delete-word      # [Ctrl-Backspace]
bindkey "^[[3~" delete-char            # [Delete]
bindkey '^[[3;5~' kill-word            # [Ctrl-Delete]
bindkey '^U' kill-whole-line           # Delete line (in insert mode)

# Utility
bindkey '^P' copy-prev-shell-word      # file rename magick
bindkey '^B' push-line-or-edit         # add push-line-or-edit function

# -------------------------------
# set prompt and cursor.
# -------------------------------
prompt edward yellow
echo -ne "\e[${prompt_cursor_mode[viins]} q" # Use underline shape cursor on startup.

# check if ${ZDOTDIR}/.zcompdump needs to be (re)compiled
zcompare ${ZDOTDIR}/.zcompdump &!

# -------------------------------------------
# highlighting plugin -- must be sourced last
# -------------------------------------------
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
ZSH_HIGHLIGHT_STYLES[cursor]='fg=226'

# disable highlighting for pasted strings
zle_highlight+=('paste:none')

# ------------------------------------------
# source key bindings and completion for fzf
# ------------------------------------------
source <(fzf --zsh)     # preferred, requires fzf 0.48 or later

#source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh

