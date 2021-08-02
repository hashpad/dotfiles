#!/bin/bash
date +%s > printnow.txt &&
maim -s ~/.local/share/Anki2/User\ 1/collection.media/$(while read line; do echo $line; done < printnow.txt).png && /home/$USER/scripts/anki/hittcb.sh $(while read line; do echo $line; done < printnow.txt).png &&
rm printnow.txt
