#!/usr/bin/env sh

SID="$1"
FOCUSED="$(aerospace list-workspaces --focused 2>/dev/null)"
if [ "$SID" = "$FOCUSED" ]; then
  sketchybar --set "space.$SID" \
    icon="■" \
    icon.font="MonoLisa Plus:Medium:15.0" \
    icon.color=0xffcba6f7 \
    background.drawing=off
else
  # Occupied spaces are bright; empty persistent spaces remain muted.
  WINDOWS="$(aerospace list-windows --workspace "$SID" 2>/dev/null)"
  if [ -n "$WINDOWS" ]; then COLOR=0xffcdd6f4; else COLOR=0xff7f849c; fi
  sketchybar --set "space.$SID" \
    icon="$SID" \
    icon.font="MonoLisa Plus:Medium:16.0" \
    icon.color="$COLOR" \
    background.drawing=off
fi
