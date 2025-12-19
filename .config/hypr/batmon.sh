#!/bin/bash

# Capacity treshold
treshold=15

while true
do
	cap=$(cat /sys/class/power_supply/BAT0/capacity)
	stat=$(cat /sys/class/power_supply/BAT0/status)
	if [ "$cap" -le "$treshold" ] && [ "$stat" == "Discharging" ]
	then
		notify-send -u critical "Battery Low" "${cap}%"
		sleep 900 # 15 min
	else
		sleep 120
	fi
done
