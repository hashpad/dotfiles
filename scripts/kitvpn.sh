#!/bin/bash

if [ "$1" = "stop" ]; then
 pkill openvpn
else
 function clean_up() {
  sleep 5s && 
  rm /home/$1/VPN/login.txt
 }
 echo "$1" > /home/$2/VPN/login.txt && 
 sudo -u $2 pass kit >> /home/$2/VPN/login.txt &&

 openvpn --config /home/$2/VPN/kit.ovpn > /dev/null & 
 #openvpn --config /home/$2/VPN/kit.ovpn
 clean_up $2
fi

