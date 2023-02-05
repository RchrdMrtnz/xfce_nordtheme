#!/bin/sh

if [ "$DESKTOP_SESSION" = "xfce" ]; then 
   sleep 10s
   killall conky
   cd "$HOME/.config/conky/first"
   conky -c "$HOME/.config/conky/first/conkyrc" &
   cd "$HOME/.config/conky/second"
   conky -c "$HOME/.config/conky/second/conkyrc" &
   exit 0
fi
