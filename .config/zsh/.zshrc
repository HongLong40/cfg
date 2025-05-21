#!/bin/zsh

# ------------------------------------------------
# set fpath, load modules, completions and prompts
# ------------------------------------------------
fpath=("${ZSH}/autoload.d" "$fpath[@]")
zmodload zsh/complist
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
autoload -Uz add-zsh-hook

# -------------------------
# autoload custom functions
# -------------------------
source ${ZSH}/autoload.zsh

# add hook to set terminal title
add-zsh-hook precmd set_terminal_title_precmd

# -------------------------------
# completions (minimalist setup)
# -------------------------------
source ${ZSH}/completion.zsh

# -------------------------------------------
# aliases, directories, history, key bindings
# -------------------------------------------
source ${ZSH}/aliases.zsh
source ${ZSH}/directories.zsh
source ${ZSH}/history.zsh
source ${ZSH}/key-bindings.zsh

#--------------------------------------------------------------------------
# additional options (main options defined in their respective *.zsh files)
# -------------------------------------------------------------------------
setopt interactive_comments     # allows comments in shell, useful when pasting commented snippets

# -------------------------------
# misc. variables
# -------------------------------
export BC_ENV_ARGS="${XDG_CONFIG_HOME}/.config/bc/bcrc"
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/rg/ripgreprc"

# -------------------------------
# prompt and cursor
# -------------------------------
prompt edward yellow
echo -ne "\e[${prompt_cursor_mode[viins]} q" # Use underline shape cursor on startup.

# check if ${ZDOTDIR}/.zcompdump needs to be (re)compiled
zcompare ${ZDOTDIR}/.zcompdump &!

# ------------------------------------------
# source key bindings and completion for fzf
# ------------------------------------------
source <(fzf --zsh)     # preferred, requires fzf 0.48 or later

# -------------------------------------------
# highlighting plugin -- must be sourced last
# -------------------------------------------
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
ZSH_HIGHLIGHT_STYLES[cursor]='fg=226'

# disable highlighting for pasted strings
zle_highlight+=('paste:none')

