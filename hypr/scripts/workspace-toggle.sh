#!/bin/bash

STATE_FILE="/tmp/hypr_last_workspace"

# Get current and target workspace
current_ws=$(hyprctl activeworkspace -j | jq '.id')
target_ws=$1

# If the target is the same as current, switch to last
if [[ "$current_ws" == "$target_ws" ]]; then
  if [[ -f "$STATE_FILE" ]]; then
    last_ws=$(cat "$STATE_FILE")
    hyprctl dispatch workspace "$last_ws"
  fi
else
  echo "$current_ws" >"$STATE_FILE"
  hyprctl dispatch workspace "$target_ws"
fi
