#!/bin/bash
n=$1
img="<img src='$n' />"
echo -n $img | xclip -selection clipboard
