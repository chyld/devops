#!/bin/bash

IFS=$'\n' read -d '' -r -a files <<<"$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"
printf "Montage file count: ${#files[@]}\n"

out_dir=$(dirname "${files[0]}")/montage
mkdir "$out_dir"
out_file="${out_dir}/montage-$(date +%Y%m%d-%H%M%S).jpg"
printf "Montage output filename: ${out_file}\n"

/home/xero/.bin/distrobox/exports/magick montage "${files[@]}" "$out_file"

notify-send "Montage created" "$out_file"
xdg-open "$out_file"
