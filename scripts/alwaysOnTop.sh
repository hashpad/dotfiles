#!/bin/bash
bash -c 'wmctrl -r :ACTIVE: -b $([[ $(xprop -id $(xprop -root -f _NET_ACTIVE_WINDOW 0x " \$0\\n" _NET_ACTIVE_WINDOW | awk "{print \$2}") _NET_WM_STATE) =~ "ABOVE" ]] && echo "remove" || echo "add"),above'
