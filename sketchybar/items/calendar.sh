#!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Semibold:13.0"
  icon.padding_right=0
  label.font="$FONT:Semibold:13.0"
  label.width=45
  label.align=right
  padding_left=15
  update_freq=20
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/open_calendar.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke

