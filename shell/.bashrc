cd ~
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# my paths
export PATH="/home/pkpao/.local/bin:/usr/share/eclipse/jee-2020-06/eclipse:$PATH"



alias vim='nvim'
alias ..='cd ..'
alias .='xdg-open .'
alias bashrc='vim ~/.bashrc'
alias src='source .bashrc'
alias bt='bluetoothctl'
alias kbind='pkill sxhkd'
alias rbind='sxhkd > /dev/null 2>&1 & disown'
alias off='shutdown -h now'
alias ls='ls --color=auto'
#function X() {
  #$(tmux list-sessions | grep -v attached | awk 'BEGIN{FS=":"}{print $1}' | xargs -n 1 tmux kill-session -t) 2&> /dev/null
#}
#function x() {
  #tmux kill-session
#}
#export PATH="$PATH:/opt/yarn-[version]/bin"
#function _update_ps1() {
        #PS1=$(powerline-shell $?)
    #}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
        #PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi
#PS1="\[$(tput bold)\]\[\033[38;5;7m\]\[\033[48;5;52m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]: \[$(tput sgr0)\]"

PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
#PS1="\[$(tput bold)\]\[$(tput setaf 3)\][\[$(tput setaf 1)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h\[$(tput setaf 3)\]] \[$(tput setaf 1)\]\w\[$(tput setaf 7)\] > \[$(tput sgr0)\]"

#PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

force_color_prompt=yes
#if (("$(ps aux | grep -o startx | awk 'END{print NR}')"<"2"));then
#startx
#fi
#exec fish
