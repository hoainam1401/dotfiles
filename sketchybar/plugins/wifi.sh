#!/usr/bin/env sh

WIFI_DEVICE="$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $2; exit}')"
STATUS="$(ifconfig "$WIFI_DEVICE" 2>/dev/null | awk '/status:/{print $2; exit}')"
SSID="$(ipconfig getsummary "$WIFI_DEVICE" 2>/dev/null | awk -F ' : ' '/^[[:space:]]*SSID :/{print $2; exit}')"

if [ -z "$WIFI_DEVICE" ] || [ "$STATUS" != "active" ]; then
  sketchybar --set "$NAME" icon="󰤮" icon.color=0xfff38ba8 label.drawing=off
else
  sketchybar --set "$NAME" icon="󰤨" icon.color=0xffcdd6f4 label.drawing=off
fi
