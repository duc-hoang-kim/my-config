#!/usr/bin/env bash

sketchybar --query bar | jq -e ".items[] | select(. == \"space.$1\")" >/dev/null || (
  sketchybar --add item space.$1 left \
    --set space.$1 \
    label.padding_left=0 \
    background.drawing=off \
    label="$1" \
    click_script="aerospace workspace $1"
  sketchybar --add item margin.$1 left \
    --set margin.$1 icon.drawing=off label.drawing=off \
    background.drawing=off width=10 \
    --move margin.$1 after space.$1

  sketchybar --add bracket group.$1 "/space\.$1.*/" \
    --set group.$1 background.color=0xff9b9b9b
)

sketchybar --set group.$2 background.color=0xff9b9b9b
sketchybar --set "/space\.$2\..*/" background.color=0x00000000
output=$(aerospace list-windows --workspace $2)
[ -z "$output" ] && sketchybar --remove space.$2

# sketchybar --set space.$1 background.color=0xEB1e1e2e
