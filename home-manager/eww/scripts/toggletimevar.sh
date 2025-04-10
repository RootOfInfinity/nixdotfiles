#!/usr/bin/env bash

var1="$(eww get ontime)"

if [[ "$var1" == "true" ]] then
  eww update ontime=false
else
  eww update ontime=true
fi
