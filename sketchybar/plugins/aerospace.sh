#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

# Only update if this workspace is the focused or previous workspace
if [ "$1" != "$FOCUSED_WORKSPACE" ] && [ "$1" != "$PREV_WORKSPACE" ]; then
  exit 0
fi

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME \
    background.color=0x60ffffff \
    background.border_color=0x60ffffff \
    background.border_width=1 \
    label.shadow.drawing=on \
    icon.shadow.drawing=on
else
  sketchybar --set $NAME \
    background.color=0x18ffffff \
    background.border_color=0x20ffffff \
    background.border_width=1 \
    label.shadow.drawing=off \
    icon.shadow.drawing=off
fi
