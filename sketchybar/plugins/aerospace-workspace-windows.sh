#!/usr/bin/env bash

source ~/.config/sketchybar/icon_map.sh

WORKSPACE=$(aerospace list-workspaces --focused)
sketchybar --set group.$WORKSPACE background.color=0xEB1e1e2e

contains_element() {
  local target_element="$1"
  shift # Remove the first argument (target_element) from the list of arguments
  local element
  for element in "$@"; do # Loop through the remaining arguments (array elements)
    if [[ "$element" == "$target_element" ]]; then
      return 0 # Element found (Bash true)
    fi
  done
  return 1 # Element not found (Bash false)
}

FOCUSED=$(aerospace list-windows --focused --format "%{window-id}")

new_windows=()
sketchybar --remove group.$WORKSPACE

while IFS= read -r line; do
  window_id="${line%% | *}"
  app_name="${line#* | }"

  icon_result=""
  __icon_map "$app_name"
  window="space.$WORKSPACE.$window_id"
  new_windows+=("\"$window\"")

  if [ -z "$(sketchybar --query "$window")" ]; then
    sketchybar --add item $window left \
      --set $window icon="$icon_result" \
      icon.font="sketchybar-app-font:Normal:14.0" \
      icon.padding_right=0 \
      label.padding_left=0 \
      --move $window before space.$WORKSPACE

  fi

  echo "$window_id $FOCUSED"
  if [ $window_id = $FOCUSED ]; then
    sketchybar --set $window background.color=0xfff5a623
  else
    sketchybar --set $window background.color=0x00000000
  fi

done < <(aerospace list-windows --workspace focused --format "%{window-id} | %{app-name}")

while IFS= read -r item; do
  if ! contains_element "$item" "${new_windows[@]}"; then
    temp_item="${item#\"}"
    item_surrounding_quotes_removed="${temp_item%\"}"
    sketchybar --remove $item_surrounding_quotes_removed
  fi
done < <(sketchybar --query bar | jq -e ".items[] | select(startswith(\"space.$WORKSPACE.\"))")

sketchybar --add bracket group.$WORKSPACE "/space\.$WORKSPACE.*/"
