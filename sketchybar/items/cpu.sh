#!/bin/bash

sketchybar --add item cpu right \
           --set cpu  update_freq=2 \
                      icon=􀧓 \
                      label.color=$RED \
                      icon.color=$RED   \
                      script="$PLUGIN_DIR/cpu.sh"
