#!/bin/bash
st -t vis -e vis & (sleep 0.1 & termite -t clyrics -e "clyrics -c") & (sleep 0.2 && st -t cmus -e cmus)
