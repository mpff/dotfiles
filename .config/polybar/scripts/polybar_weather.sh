#!/bin/bash

source "$HOME/.config/polybar/scripts/colors.sh"

get_icon() {
    case $1 in
        113)                             printf "\uf00d";; # sunny
        116)                             printf "\uf002";; # partly cloudy
        119|122)                         printf "\uf013";; # cloudy
        143|248|260)                     printf "\uf014";; # fog
        176|263|353|356)                 printf "\uf01a";; # showers
        179|227|230|323|326|329|332|335|338|368|371) printf "\uf01b";; # snow
        182|317|320|362|365)             printf "\uf0b5";; # sleet
        185|266|281|284|293|296|299|302|305|308|311|314|359) printf "\uf019";; # rain
        200|386|389|392|395)             printf "\uf01e";; # thunderstorm
        350|374|377)                     printf "\uf015";; # hail
        *)                               printf "\uf07b";; # N/A
    esac
}

DATA=$(curl -s "wttr.in/?format=j1" 2>/dev/null)
[ -z "$DATA" ] && echo "N/A" && exit 1

TEMP_NOW=$(echo "$DATA" | jq -r '.current_condition[0].temp_C')
CODE_NOW=$(echo "$DATA" | jq -r '.current_condition[0].weatherCode')
TEMP_MAX=$(echo "$DATA" | jq -r '.weather[0].maxtempC')
TEMP_MIN=$(echo "$DATA" | jq -r '.weather[0].mintempC')

ICON_NOW=$(get_icon "$CODE_NOW")

echo " $dark0_soft[$light0_soft %{T4}${ICON_NOW}%{T-} ${TEMP_NOW}°C $dark0_soft·$light0_soft ↑${TEMP_MAX}° ↓${TEMP_MIN}° $dark0_soft] "
