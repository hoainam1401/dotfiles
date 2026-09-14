#!/usr/bin/env sh

IDLE="$(top -l 1 -n 0 | awk '/CPU usage/ {gsub(/%/,"",$7); print $7}')"
[ -z "$IDLE" ] && exit 0
USAGE="$(awk -v idle="$IDLE" 'BEGIN { printf "%.0f", 100-idle }')"

if [ "$USAGE" -ge 85 ]; then COLOR=0xfff7768e
elif [ "$USAGE" -ge 65 ]; then COLOR=0xffe0af68
else COLOR=0xff9ece6a
fi

sketchybar --set "$NAME" icon.color="$COLOR" label="$USAGE%"
