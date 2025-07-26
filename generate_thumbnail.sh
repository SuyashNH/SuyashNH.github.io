#!/bin/bash

cd ./assets/photos/
mkdir -p ../thumbnail

target_width=800
target_height=800
output_quality=80

for img in *.jpg *.jpeg *.png *.JPG *.JPEG *.PNG; do
    [ -e "$img" ] || continue
    echo -n "Generating thumbnail: $img"
    magick "$img" \
        -resize "${target_width}x${target_height}^>" \
        -quality $output_quality \
        -unsharp 0.5x0.5+0.5+0.008 \
        "../thumbnail/$img"
    echo -e "\e[36m\tDONE\e[0m"
done
