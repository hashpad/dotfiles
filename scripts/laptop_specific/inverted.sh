#!/bin/bash
xrandr --output eDP --rotate inverted &&  xinput set-prop 'Wacom HID 51C4 Finger touch' --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1 && xinput map-to-output 'Wacom HID 51C4 Finger touch' eDP && xinput map-to-output 14 eDP;

xinput set-prop 'Wacom HID 51C4 Pen stylus' --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1 && xinput map-to-output 'Wacom HID 51C4 Pen stylus' eDP && xinput map-to-output 14 eDP
