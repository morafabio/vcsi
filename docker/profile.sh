#!/usr/bin/env bash
set -ue

function all-medium() {
  vcsi -t \
    --template tests/templates/generic.jinja2 \
    -g 4x10 -w 2560 \
    --metadata-font-size 16 \
    /app/media/*.mkv /app/media/*.avi /app/media/*.mp4 /app/media/.mpg
}
