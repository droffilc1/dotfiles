#!/bin/bash

# --- CONFIG ---
WALLPAPERS_DIR="$HOME/Pictures/wallpapers"
LOCKFILE="/tmp/random-wallpaper.lock"
LAST_WALLPAPER_FILE="$HOME/.cache/random-wallpaper-last"

# --- PREVENT DUPLICATE RUNS ---
if [ -f "$LOCKFILE" ] && kill -0 "$(cat "$LOCKFILE")" 2>/dev/null; then
  echo "Wallpaper script already running (PID $(cat "$LOCKFILE")). Exiting."
  exit 0
fi

# Save current PID
echo $$ >"$LOCKFILE"

# Clean up lock on exit
trap "rm -f '$LOCKFILE'" EXIT

# --- HELPER: pick a new random wallpaper that isn't the same as last ---
pick_wallpaper() {
  local new_wallpaper
  while true; do
    new_wallpaper=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
    if [[ ! -f "$LAST_WALLPAPER_FILE" ]] || [[ "$new_wallpaper" != "$(cat "$LAST_WALLPAPER_FILE")" ]]; then
      echo "$new_wallpaper"
      return
    fi
  done
}

# --- MAIN LOOP ---
while true; do
  RANDOM_WALLPAPER=$(pick_wallpaper)

  # Apply the wallpaper
  swww img "$RANDOM_WALLPAPER" \
    --transition-type grow \
    --transition-pos 0.5,0.5 \
    --transition-duration 1

  # Save it as the last wallpaper used
  echo "$RANDOM_WALLPAPER" >"$LAST_WALLPAPER_FILE"

  sleep 1800
done
