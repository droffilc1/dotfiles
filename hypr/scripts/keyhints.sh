#!/bin/bash
BACKEND=wayland
# Check if rofi or yad is running and kill them if they are
if pidof rofi > /dev/null; then
  pkill rofi
fi


if pidof yad > /dev/null; then
  pkill yad
fi
# Launch yad with calculated width and height
GDK_BACKEND=$BACKEND yad \
    --center \
    --title="Quick Cheat Sheet" \
    --no-buttons \
    --list \
    --column=Key:\
    --column=Description:\
    --column=Command:\
    --timeout-indicator=bottom \
"ESC" "❌ Close this app" "" \
"" " SUPER KEY (Windows Key)" "(mainMod)" \
"" "" "" \
" return" "💻 Terminal" "(kitty)" \
" Q" "🚪 Close active window" "(killactive)" \
" M" "🔚 Exit Hyprland" "(exit)" \
" E" "📁 Open File Manager" "(Thunar)" \
" F" "🎈 Toggle floating" "(togglefloating)" \
" R" "🚀 Application Launcher" "(rofi)" \
" P" "📐 Pseudo-tile" "(dwindle)" \
" J" "✂️ Toggle split" "(dwindle)" \
" V" "📋 Clipboard Manager" "(cliphist)" \
" SHIFT N" "🔔 Launch Notification Panel" "(swaync)" \
" SHIFT L" "🔒 Screen Lock" "(hyprlock)" \
"Print" "📸 Screenshot window" "(hyprshot)" \
"SHIFT Print" "📷 Screenshot region" "(hyprshot)" \
" I" "📊 System Monitor" "(btop)" \
" A" "🔊 Audio Control" "(pavucontrol)" \
" N" "🌐 Network Manager" "(nm-connection-editor)" \
" B" "🔵 Bluetooth Manager" "(blueberry)" \
" C" "🔄 Restart Chrome" "(script)" \
"WIN F1" "🎮 Toggle Gamemode" "(script)" \
" H" "❓ Launch this Quick Cheat Sheet" "" \
"" "" "" \
" L" "⬅️ Move focus left" "" \
" H" "➡️ Move focus right" "" \
" K" "⬆️ Move focus up" "" \
" J" "⬇️ Move focus down" "" \
"" "" "" \
" 1-9,0" "🔢 Switch to workspace 1-10" "(workspace toggle script)" \
" SHIFT 1-9,0" "📤 Move window to workspace 1-10" "" \
" S" "✨ Toggle special workspace" "(scratchpad)" \
" SHIFT S" "📥 Move to special workspace" "" \
" mouse_scroll" "🖱️ Scroll through workspaces" "" \
"" "" "" \
" LMB drag" "👆 Move window" "" \
" RMB drag" "🔲 Resize window" "" \
"" "" "" \
"XF86AudioRaiseVolume" "🔊 Raise volume" "(swayosd)" \
"XF86AudioLowerVolume" "🔉 Lower volume" "(swayosd)" \
"XF86AudioMute" "🔇 Mute/Unmute audio" "(swayosd)" \
"XF86MonBrightnessUp" "☀️ Raise brightness" "(swayosd)" \
"XF86MonBrightnessDown" "🌙 Lower brightness" "(swayosd)" \
"" "" ""
