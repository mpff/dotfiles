#!/bin/bash
# 
# Battery status as am RPG-like "health bar" with hearts and half-hearts.
# To be used with polybar or similar. This should work for a ThinkPad with
# two batteries installed.
#
# It also shows desktop notifications when the battery is low (notify-send).
#
# Author: machaerus
# https://gitlab.com/machaerus
#
# Original idea for calculating the battery % is not mine, unfortunately
# I don't remember the source.

source $HOME/.config/polybar/scripts/colors.sh

battery_print() {

	PATH_AC="/sys/class/power_supply/AC"
	PATH_BATTERY_0="/sys/class/power_supply/BAT0"
	PATH_BATTERY_1="/sys/class/power_supply/BAT1"

	ac=0
	battery_level_0=0
	battery_level_1=0
	battery_max_0=0
	battery_max_1=0

	# check if ac connected
	if [ -f "$PATH_AC/online" ]; then
		ac=$(cat "$PATH_AC/online")
	fi

	# calculate battery level
	if [ -f "$PATH_BATTERY_0/energy_now" ]; then
		battery_level_0=$(cat "$PATH_BATTERY_0/energy_now")
	fi

	if [ -f "$PATH_BATTERY_0/energy_full" ]; then
		battery_max_0=$(cat "$PATH_BATTERY_0/energy_full")
	fi

	if [ -f "$PATH_BATTERY_1/energy_now" ]; then
		battery_level_1=$(cat "$PATH_BATTERY_1/energy_now")
	fi

	if [ -f "$PATH_BATTERY_1/energy_full" ]; then
		battery_max_1=$(cat "$PATH_BATTERY_1/energy_full")
	fi

	battery_level=$(("$battery_level_0 + $battery_level_1"))
	battery_max=$(("$battery_max_0 + $battery_max_1"))

	battery_percent=$(("$battery_level * 100"))
	battery_percent=$(("$battery_percent / $battery_max"))

	# echo output
	if [ "$battery_percent" -gt 25 ]; then
		battery_icon=""
		battery_color="$faded_green"
	elif [ "$battery_percent" -gt 10 ]; then
		battery_icon=""
		battery_color="$faded_yellow"
	else
		battery_icon=""
		battery_color="$faded_red"
	fi

	if [ "$ac" -eq 1 ]; then
		echo "$dark0_soft[ $bright_yellow$RESET $battery_percent% $dark0_soft]"
	else
		echo "$dark0_soft[ $battery_color$battery_icon$RESET $battery_percent% $dark0_soft]"
	fi
}

battery_print

