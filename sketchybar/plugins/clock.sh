#!/usr/bin/env sh

case "$NAME" in
  clock.internal) FORMAT='+%a %H:%M' ;;
  *)              FORMAT='+%A %H:%M' ;;
esac

sketchybar --set "$NAME" label="$(date "$FORMAT")"
