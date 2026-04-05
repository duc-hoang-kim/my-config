#!/bin/sh

# Claude Code status indicator
# Colors/labels during active sessions are driven by hooks in ~/.claude/settings.json
# This script only manages visibility and session count (runs on update_freq)

count=$(pgrep -x "claude" 2>/dev/null | wc -l | tr -d ' ')

if [ "$count" -gt 0 ]; then
  # If a session is active (hook wrote the flag), don't override the label
  if [ -f /tmp/claude_sb_active ]; then
    exit 0
  fi

  if [ "$count" -gt 1 ]; then
    label="Claude (${count})"
  else
    label="Claude"
  fi
  sketchybar --set claude_code \
    icon.color=0xff89b4fa \
    label="$label" \
    label.drawing=on
else
  rm -f /tmp/claude_sb_active
  sketchybar --set claude_code \
    icon.color=0x44ffffff \
    label.drawing=off
fi
