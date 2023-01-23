#!/bin/bash
date +%s > printnow.txt &&
flameshot gui --path ~/.local/share/Anki2/User\ 1/collection.media/$(while read line; do echo $line; done < printnow.txt).png 
/home/$USER/dotfiles/scripts/anki/hittcb.sh $(while read line; do echo $line; done < printnow.txt).png 
rm printnow.txt
