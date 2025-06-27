#!/usr/bin/env bash

# requires pulsemixer
# awk -F"'" '/Default/ {print $2}' <(pulsemixer --list-sinks)
str1=awk -F":" '/Default/ {print $5}'

if [[ "$str1" == " 0, Channels" ]]; then
    echo "false"
else
    echo "true"
fi
