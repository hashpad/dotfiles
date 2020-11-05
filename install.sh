#!/bin/bash
rsync -avr . ~/ --exclude .git --exclude grub+systemd_services
