#!/usr/bin/env sh

CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"
. "$CONFIG_DIR/colors.sh"

SID="$1"
FOCUSED="$(aerospace list-workspaces --focused 2>/dev/null)"
if [ "$SID" = "$FOCUSED" ]; then
  sketchybar --animate tanh 12 --set "space.$SID" \
    icon="■" \
    icon.font="MonoLisa Plus:Medium:15.0" \
    icon.color="$ACCENT" \
    background.drawing=off
else
  WINDOWS="$(aerospace list-windows --workspace "$SID" 2>/dev/null)"
  if [ -n "$WINDOWS" ]; then
    ICON="●"
    FONT="MonoLisa Plus:Medium:10.0"
    COLOR="$FOREGROUND"
  else
    ICON="$SID"
    FONT="MonoLisa Plus:Medium:14.0"
    COLOR="$MUTED"
  fi
  sketchybar --animate tanh 12 --set "space.$SID" \
    icon="$ICON" \
    icon.font="$FONT" \
    icon.color="$COLOR" \
    background.drawing=off
fi
