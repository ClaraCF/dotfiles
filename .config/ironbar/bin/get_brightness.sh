#!/bin/sh

BRIGHTNESS="$(brightnessctl i | grep % | sed s'/.*(//' | sed s'/%).*//')"
echo -n "󰃚 ${BRIGHTNESS}%"
