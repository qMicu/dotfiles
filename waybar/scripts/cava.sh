#!/bin/bash

blocks=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

cava -p ~/.config/cava/config | while IFS=';' read -r -a values; do
    output=""
    for i in "${values[@]}"; do
        # Elimină spațiile/goale și convertește la număr
        index=$(echo "$i" | tr -d '[:space:]')
        if [[ "$index" =~ ^[0-9]+$ ]] && (( index >= 0 && index < 8 )); then
            output+="${blocks[index]}"
        else
            output+=" "
        fi
    done
    echo "{\"text\":\"$output\", \"tooltip\":\"Audio Visualizer\"}"
done