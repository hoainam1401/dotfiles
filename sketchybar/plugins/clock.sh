#!/usr/bin/env sh

case "$NAME" in
  clock.internal) FORMAT='+%a %d %b %H:%M' ;;
  *)              FORMAT='+%A %d %b %H:%M' ;;
esac

sketchybar --set "$NAME" label="$(date "$FORMAT")"
