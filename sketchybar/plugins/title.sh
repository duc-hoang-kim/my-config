source ~/.config/sketchybar/icon_map.sh

TITLE=$(aerospace list-windows --focused --format "%{app-name}")
__icon_map $TITLE

NOTI_COUNT=$(lsappinfo info -only StatusLabel "$TITLE" | grep -o '"label"="[0-9]*"' | cut -d'"' -f4)

if [[ $NOTI_COUNT != "" ]]; then
  sketchybar --set title icon="$icon_result" \
    label="$TITLE | $NOTI_COUNT"
else
  sketchybar --set title icon="$icon_result" \
    label="$TITLE"
fi

if [[ "$icon_result" =~ ^:.+:$ ]]; then
  sketchybar --set title icon.font="sketchybar-app-font:Normal:14.0"
else
  sketchybar --set title icon.font="Hack Nerd Font:Bold:14.0"
fi
