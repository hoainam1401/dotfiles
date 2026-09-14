#!/usr/bin/env sh

if ! command -v nowplaying-cli >/dev/null 2>&1; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

TITLE="$(nowplaying-cli get title 2>/dev/null | head -1)"
RATE="$(nowplaying-cli get playbackRate 2>/dev/null | head -1)"

case "$TITLE" in
  ""|"(null)"|null) sketchybar --set "$NAME" drawing=off; exit 0 ;;
esac

# Display the action available on click: pause while playing, play while paused.
case "$RATE" in
  0|0.0|"(null)"|null|"") ICON="󰐊" ;;
  *)                         ICON="󰏤" ;;
esac

sketchybar --set "$NAME" drawing=on icon="$ICON" label="$TITLE"
