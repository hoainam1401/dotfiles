#!/usr/bin/env sh

CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"
. "$CONFIG_DIR/colors.sh"

case "${SENDER:-}" in
  mouse.entered)
    sketchybar --set "$NAME" background.drawing=on
    sketchybar --animate tanh 12 --set "$NAME" \
      background.color="$HOVER_BG_COLOR" \
      background.height=30 \
      background.corner_radius=7
    exit 0
    ;;
  mouse.exited)
    case "$NAME" in
      front_app|media)
        sketchybar --animate tanh 12 --set "$NAME" \
          background.color="$ITEM_BG_COLOR" \
          background.height=27 \
          background.corner_radius=7 \
          background.drawing=on
        ;;
      *)
        sketchybar --animate tanh 12 --set "$NAME" background.color="$TRANSPARENT"
        ;;
    esac
    exit 0
    ;;
esac

[ "$#" -eq 0 ] || exec "$@"
