#!/bin/bash

AC_PATH="/org/freedesktop/UPower/devices/line_power_AC"
last_state=""

# 🔹 Initial check (silent)
state=$(upower -i "$AC_PATH" | awk '/online:/ {print $2}')
if [ "$state" = "yes" ]; then
    powerprofilesctl set performance
else
    powerprofilesctl set power-saver
fi
last_state="$state"

# 🔹 Monitor loop
upower --monitor-detail | while read -r line; do
    if echo "$line" | grep -q "$AC_PATH"; then
        state=$(upower -i "$AC_PATH" | awk '/online:/ {print $2}')
        if [ "$state" != "$last_state" ]; then
            if [ "$state" = "yes" ]; then
                powerprofilesctl set performance
                notify-send -i battery-full "Power profile" "⚡ Switched to Performance (AC plugged in)"
            else
                powerprofilesctl set power-saver
                notify-send -i battery-low "Power profile" "🔋 Switched to Power Saver (on battery)"
            fi
            last_state="$state"
        fi
    fi
done

