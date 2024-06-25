#!/bin/sh
SOURCE=$(pactl get-default-source)
if [ "$(pactl get-source-mute $SOURCE)" == "Mute: yes" ]
then
	pactl set-source-mute $SOURCE 0
else
	pactl set-source-mute $SOURCE 1
fi
