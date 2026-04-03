#!/bin/bash
#
# Show a custom network connection indicator in polybar.
# Includes code for WiFi and VPN.
#
# Author: machaerus
# https://gitlab.com/machaerus

source $HOME/.config/polybar/scripts/colors.sh

net_print() {

	ESSID=$(iwconfig wlan0 | grep ESSID | cut -d: -f2 | xargs)
	[ "$ESSID" = "off/any" ] && CONNECTED_WIFI=0 || CONNECTED_WIFI=1
	CONNECTED_VPN=$(ifconfig -a | grep tun0 | wc -l)
	
	if [ "$CONNECTED_WIFI" -eq 1 ]; then
		wifi_indicator="${faded_green}%{T1}${RESET}"
	else
		wifi_indicator="${dark0_soft}%{T1}${RESET}"
	fi

	if [ "$CONNECTED_VPN" -eq 1 ]; then
		vpn_indicator="${faded_green}%{T1}${RESET}"
	else
		vpn_indicator="${dark0_soft}%{T1}${RESET}"
	fi

	echo "$dark0_soft[ $wifi_indicator $ESSID $vpn_indicator $dark0_soft]"
}

net_print

