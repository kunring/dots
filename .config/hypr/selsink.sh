#!/usr/bin/bash

SINK=$(pactl list short sinks | awk '{print $2}' | wofi --dmenu)
[ -z "$SINK" ] && exit

pactl set-default-sink $SINK
pactl list sink-inputs | grep "Sink Input" | while read -r line; do pactl move-sink-input $(echo $line | cut-f2 -d'#') $SINK; done
