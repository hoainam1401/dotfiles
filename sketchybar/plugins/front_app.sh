#!/usr/bin/env sh

CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"
. "$CONFIG_DIR/plugins/icon_map.sh"

# INFO is an app name for front_app_switched. A custom AeroSpace event may
# instead carry a workspace id, so query AeroSpace in that case.
APP=""
case "${INFO:-}" in
  ""|[0-9]|g) ;;
  *) APP="$INFO" ;;
esac

if [ -z "$APP" ]; then
  APP="$(aerospace list-windows --focused --format '%{app-name}' 2>/dev/null | head -1)"
fi

if [ -n "$APP" ]; then
  ICON="$(app_icon "$APP")"
  sketchybar --set "$NAME" icon="$ICON" icon.drawing=on label="$APP" label.drawing=on
else
  WORKSPACE="$(aerospace list-workspaces --focused 2>/dev/null)"
  sketchybar --set "$NAME" icon="󰇄" icon.drawing=on label="Workspace ${WORKSPACE:-—}" label.drawing=on
fi
