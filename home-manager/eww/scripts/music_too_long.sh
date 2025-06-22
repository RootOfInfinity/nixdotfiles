#!/usr/bin/env bash

musicstr="$(eww get music)"
musicsize="${#musicstr}"

while :
do
  sleep 5
  musicstr="$(eww get music)"
  musicsize="${#musicstr}"
  if [ "$musicsize" -gt "38" ]; then
    eww update music="${musicstr:0:35}..."
    echo "updated"
  fi
done
