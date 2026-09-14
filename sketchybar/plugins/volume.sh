#!/usr/bin/env sh

VOL="${INFO:-$(osascript -e 'output volume of (get volume settings)')}"
MUTED="$(osascript -e 'output muted of (get volume settings)')"

if [ "$MUTED" = "true" ] || [ "$VOL" -eq 0 ]; then ICON="󰖁"
elif [ "$VOL" -lt 35 ]; then ICON="󰕿"
elif [ "$VOL" -lt 70 ]; then ICON="󰖀"
else ICON="󰕾"
fi

sketchybar --set "$NAME" icon="$ICON" label="$VOL%"
