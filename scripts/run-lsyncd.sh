#!/bin/bash
LSYNCD_CONFIG=/Users/jim.cadden/lsyncd.lua
ps aux | grep "lsyncd $LSYNCD_CONFIG" | grep -v grep &> /dev/null
if [[ $? -eq 1 ]]; then
  echo "Running lsyncd..."
  sudo cp -r ~/.ssh ~root/
  sudo lsyncd $LSYNCD_CONFIG 
  if [[ $? -eq -1 ]]; then
    echo "lsyncd failed."
  fi
fi

