#!/bin/zsh

# 2025-05-21
#   - remove compiling of .zcompdump (no real benefit)
#   - change compinit to compinit -C (performance benefit)
#   - load completions early
# 2025-05-23
#   - add options for FZF

# Set fpath
fpath=("${ZSH}/autoload.d" "$fpath[@]")

# Load completion system early
autoload -Uz compinit && compinit -C
zmodload zsh/complist
source ${ZSH}/completion.zsh    # zstyle rules

# Load prompt system and hooks
autoload -Uz promptinit && promptinit
autoload -Uz add-zsh-hook

# Prompt and cursor
prompt edward yellow
echo -ne "\e[${prompt_cursor_mode[viins]} q" # Use underline shape cursor on startup.

# Autoload custom functions
source ${ZSH}/autoload.zsh

# Add hook to set terminal title. This is an autoloaded function
add-zsh-hook precmd set_terminal_title_precmd

# Other modular settings
source ${ZSH}/aliases.zsh
source ${ZSH}/directories.zsh
source ${ZSH}/history.zsh
source ${ZSH}/key-bindings.zsh

# Load run-help function (aliased to man by default)
unalias run-help 2> /dev/null   # don't display err if already done
autoload -Uz run-help           # load the function
alias help=run-help             # less typing

# Additional options (main options defined in their respective *.zsh files)
setopt interactive_comments     # allows comments in shell, useful when pasting commented snippets

# Source key bindings and completion for fzf; set options
source <(fzf --zsh)             # preferred, requires fzf 0.48 or later
export FZF_DEFAULT_OPTS="--style=minimal --border --color=hl:#00cccc"
export FZF_CTRL_R_OPTS="--layout=default --color=fg+:#c4a000 --color=bg+:-1 --no-sort"

# Highlighting plugin -- must be sourced last per author's instructions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
ZSH_HIGHLIGHT_STYLES[cursor]='fg=226'

# Disable highlighting for pasted strings
zle_highlight+=('paste:none')
