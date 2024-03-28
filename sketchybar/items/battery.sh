#!/bin/bash

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="$FONT:Regular:19.0"
  padding_left=0
  update_freq=120
  updates=on
  click_script="open -a /System/Applications/Utilities/Activity\ Monitor.app"
)

sketchybar --add item battery right      \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
