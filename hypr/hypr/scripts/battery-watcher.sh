#!/bin/bash

LOW_THRESHOLD=15
FULL_THRESHOLD=95
NOTIFIED_LOW=false
NOTIFIED_FULL=false

while true; do
  capacity=$(cat /sys/class/power_supply/BAT*/capacity)
  status=$(cat /sys/class/power_supply/BAT*/status)

  if [ "$status" = "Discharging" ] && [ "$capacity" -le "$LOW_THRESHOLD" ] && [ "$NOTIFIED_LOW" = false ]; then
    notify-send "⚠️ Battery Low" "Battery is at ${capacity}%!"
    canberra-gtk-play -i battery-low -d "battery-watcher"
    NOTIFIED_LOW=true
    NOTIFIED_FULL=false

  elif [ "$status" = "Full" ] && [ "$capacity" -ge "$FULL_THRESHOLD" ] && [ "$NOTIFIED_FULL" = false ]; then
    notify-send "🔋 Battery Full" "Battery is at ${capacity}%. You can unplug the charger."
    canberra-gtk-play -i complete -d "battery-watcher"
    NOTIFIED_FULL=true
    NOTIFIED_LOW=false

  elif [ "$capacity" -gt "$LOW_THRESHOLD" ] && [ "$capacity" -lt "$FULL_THRESHOLD" ]; then
    # Reset flags so they notify again when threshold is crossed
    NOTIFIED_LOW=false
    NOTIFIED_FULL=false
  fi

  sleep 60
done
