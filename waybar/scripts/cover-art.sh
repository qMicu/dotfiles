#!/bin/bash

cache_dir="$HOME/.cache"
cover_path="$cache_dir/waybar-cover"
default_cover="/usr/share/icons/hicolor/128x128/apps/audio-player.png"

# Detectează player chromium
player=$(playerctl -l 2>/dev/null | grep -E '^chromium' | head -n 1)

if [ -z "$player" ]; then
  echo "{\"image\": \"$default_cover\", \"tooltip\": \"Nicio melodie redată\"}"
  exit 0
fi

status=$(playerctl -p "$player" status 2>/dev/null)
if [[ "$status" != "Playing" && "$status" != "Paused" ]]; then
  echo "{\"image\": \"$default_cover\", \"tooltip\": \"Nicio melodie redată\"}"
  exit 0
fi

# Obține URL cover
url=$(playerctl -p "$player" metadata mpris:artUrl 2>/dev/null | sed 's/^file:\/\///;s/%20/ /g')

# Generează nume cu extensie corectă
if [[ "$url" =~ \.png ]]; then
  final_path="$cover_path.png"
elif [[ "$url" =~ \.jpe?g ]]; then
  final_path="$cover_path.jpg"
else
  final_path="$cover_path.png"
fi

# Descarcă sau copiază
if [[ "$url" =~ ^http ]]; then
  curl -sL "$url" --output "$final_path"
elif [[ -f "$url" ]]; then
  cp "$url" "$final_path"
else
  cp "$default_cover" "$final_path"
fi

# Titlu/artist
title=$(playerctl -p "$player" metadata title 2>/dev/null)
artist=$(playerctl -p "$player" metadata artist 2>/dev/null)

# JSON pentru Waybar
echo "{\"image\": \"$final_path\", \"tooltip\": \"$artist - $title\"}"
