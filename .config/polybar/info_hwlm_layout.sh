#!/usr/bin/env bash

herbstclient --idle "attribute_changed" 2>/dev/null | {

    while true
    do
        # Read tags into $tags as array
        _layout=$(herbstclient layout | awk -F ":" '/FOCUS/ { split($1,b," "); print b[2] }')

        {
            #echo "%{F#FFFFFF}"

            case ${_layout} in
                'grid')
                    echo "  G  "
                    ;;
                'horizontal')
                    echo "  H  "
                    ;;
                'max')
                    echo "  M  "
                    ;;
                'vertical')
                    echo "  V "
                    ;;
                *)
                    echo " ??? "
                    ;;
            esac

            echo "%{F-}"
        } | tr -d "\n"

        echo

        # wait for next event from herbstclient --idle
        read -r || break
    done

} 2>/dev/null
