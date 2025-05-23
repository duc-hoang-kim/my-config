source ./icon_map.sh

TITLE=$(aerospace list-windows --focused --format "%{app-name}")
__icon_map $TITLE

NOTI_COUNT=$(lsappinfo info -only StatusLabel "$TITLE" | grep -o '"label"="[0-9]*"' | cut -d'"' -f4)

sketchybar --set title icon="$icon_result" \
  label="$TITLE | $NOTI_COUNT"

if [[ "$icon_result" =~ ^:.+:$ ]]; then
  sketchybar --set title icon.font="sketchybar-app-font:Normal:14.0"
else
  sketchybar --set title icon.font="Hack Nerd Font:Bold:14.0"
fi

#
# if [ "$TITLE" == "" ]; then
#   sketchybar --animate circ 15 --set title y_offset=70
#   sketchybar --set title_proxy label=""
#   sketchybar --set title label=""
# else
#   LABEL=$TITLE
#   if [ "$(sketchybar --query title_proxy | jq -r '.label.value')" != "$LABEL" ]; then
#     sketchybar --set title_proxy label="$LABEL"
#     sketchybar --animate circ 15 --set title y_offset=70 \
#       --animate circ 10 --set title y_offset=7 \
#       --animate circ 15 --set title y_offset=0
#
#   fi
# fi
#
