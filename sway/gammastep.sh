#!/bin/bash

if [ $(pgrep -c -f gammastep-indicator) -ge 1 ]; then
    echo "gammastep-indicator is already running"
    exit 0
fi

gammastep-indicator &
