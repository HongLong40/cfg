#!/bin/zsh

typeset -i _max_lines=30
typeset _lines_inp=$(</tmp/pacman_updates.count)

typeset -i _lines

if [[ ${_lines_inp} == "-" ]]
then
    exit 0
fi

_lines=$(</tmp/pacman_updates | wc -l)

if [[ ${_lines} -gt ${_max_lines} ]]
then
    _lines=30
fi

awk '{ printf("%2s %s\n", NR, $0) }' /tmp/pacman_updates | \
    rofi \
    -dmenu \
    -i \
    -xoffset -8 \
    -yoffset 32 \
    -p "Pacman and AUR Updates" \
    -no-show-icons \
    -theme-str "entry {enabled: false;} window {width: 25%; location: north east;} listview {lines: ${_lines}; spacing: 0px;}"
