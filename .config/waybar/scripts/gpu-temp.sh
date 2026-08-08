#!/usr/bin/env bash

TEMP_FILE=$(ls /sys/class/drm/card1/device/hwmon/hwmon3/temp1_input 2>/dev/null | head -n 1)

if [ -f "$TEMP_FILE" ]; then
    TEMP_RAW=$(cat "$TEMP_FILE")
    TEMP=$((TEMP_RAW / 1000))
else
    TEMP=$(sensors 2>/dev/null | grep -i "edge" | head -n 1 | awk '{print $2}' | tr -d '+°C' | cut -d'.' -f1)
fi

TEMP=${TEMP:-0}

if [ "$TEMP" -ge 80 ]; then
    CLASS="critical"
    ICON="󰈸"
elif [ "$TEMP" -ge 65 ]; then
    CLASS="warning"
    ICON="󰈸"
else
    CLASS="normal"
    ICON="󰢮"
fi

echo "{\"text\": \"$ICON ${TEMP}°C\", \"tooltip\": \"GPU AMD: ${TEMP}°C\", \"class\": \"$CLASS\"}"
