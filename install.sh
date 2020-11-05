#!/bin/bash
rsync -avr * ~/ --exclude .git
