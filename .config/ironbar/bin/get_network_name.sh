#!/bin/bash


# To calculate signal strength
export MIN_DBM=-90
export MAX_DBM=-45

export ICONS=("󰤨" "󰤥" "󰤢" "󰤟" "󰤯" "󰤮")
export ICON=""

export NETWORK_NAME="$(iwctl station wlan0 show | grep 'Connected network' | sed s'/.*Connected network     //' | sed s'/ *$//')"
export SIGNAL_STRENGTH="$(iw dev wlan0 link | grep 'signal' | sed s'/.*: //' | sed s'/ .*//')"


if [ -z "${NETWORK_NAME}" ]
then
    NETWORK_NAME="Disconnected"
    ICON="${ICONS[5]}"

    echo -n "${ICON} ${NETWORK_NAME}"
    exit
fi


# Thresholds are as follows:
# Excellent: -30 to -50
# Good: -50 to -60
# Medium: -60 to -70
# Bad: -70 to -80
# Terrible: < -80

if [ "$SIGNAL_STRENGTH" -ge -50 ]
then
    # Excellent
    ICON="${ICONS[0]}"
elif [ "$SIGNAL_STRENGTH" -ge -60 ]
then
    # Good
    ICON="${ICONS[1]}"
elif [ "$SIGNAL_STRENGTH" -ge -70 ]
then
    # Medium
    ICON="${ICONS[2]}"
elif [ "$SIGNAL_STRENGTH" -ge -80 ]
then
    # Bad
    ICON="${ICONS[3]}"
else
    # Terrible
    ICON="${ICONS[4]}"
fi


let "SIGNAL_STRENGTH_PERCENTAGE = ($SIGNAL_STRENGTH - $MIN_DBM) / ($MAX_DBM - $MIN_DBM) * 100"
#export SIGNAL_STRENGTH_PERCENTAGE=$(((SIGNAL_STRENGTH - (MIN_DBM)) / (MAX_DBM - (MIN_DBM)) * 100))

echo -n "${ICON} ${NETWORK_NAME} (${SIGNAL_STRENGTH_PERCENTAGE}%)"

