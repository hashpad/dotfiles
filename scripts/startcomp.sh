#!/bin/bash
xfconf-query -c xfwm4 -p /general/use_compositing -s true
picom & disown
