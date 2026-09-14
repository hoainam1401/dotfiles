#!/usr/bin/env sh

PERCENT="$(pmset -g batt | grep -Eo '[0-9]+%' | head -1 | tr -d '%')"
[ -z "$PERCENT" ] && exit 0
SOURCE="$(pmset -g batt | head -1)"

if printf '%s' "$SOURCE" | grep -q "AC Power"; then ICON="󰂄"
elif [ "$PERCENT" -ge 80 ]; then ICON="󰁹"
elif [ "$PERCENT" -ge 60 ]; then ICON="󰂀"
elif [ "$PERCENT" -ge 40 ]; then ICON="󰁾"
elif [ "$PERCENT" -ge 20 ]; then ICON="󰁼"
else ICON="󰁺"
fi

if [ "$PERCENT" -le 15 ]; then COLOR=0xfff38ba8
elif [ "$PERCENT" -le 30 ]; then COLOR=0xfff9e2af
else COLOR=0xffcdd6f4
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="$PERCENT%"
