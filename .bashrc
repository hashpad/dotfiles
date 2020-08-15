#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# my paths
export PATH="/usr/share/eclipse/jee-2020-06/eclipse:$PATH"



alias off='shutdown -h now'
alias ls='ls --color=auto'
export PATH="$PATH:/opt/yarn-[version]/bin"
PS1="\[$(tput bold)\]\[$(tput setaf 3)\][\[$(tput setaf 1)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h\[$(tput setaf 3)\]] \[$(tput setaf 1)\]\w\[$(tput setaf 7)\] > \[$(tput sgr0)\]"

#PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

force_color_prompt=yes
if (("$(ps aux | grep -o startx | awk 'END{print NR}')"<"2"));then
startx
fi
