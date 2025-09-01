#!/bin/bash

sketchybar --add item front_app left \
           --set front_app       background.color=$MAUVE \
                                 icon.color=$BASE \
                                 icon.font="sketchybar-app-font:Regular:13.0" \
                                 label.color=$BASE \
                                 script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched
