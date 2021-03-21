#!/bin/bash
ffmpeg \
-f x11grab -r 30 -s 1920x1080 -i :0.0+0,0 \
-vcodec libx264 -preset veryfast -crf 18 \
-acodec libmp3lame -ar 44100 -q:a 1 \
-pix_fmt yuv420p \
$HOME/$1.mkv
