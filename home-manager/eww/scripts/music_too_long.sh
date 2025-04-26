#!/usr/bin/env bash

musicstr="$(eww get music)"
musicsize="${#musicstr}"

while :
do
  sleep 5
  musicstr="$(eww get music)"
  musicsize="${#musicstr}"
  if [ "$musicsize" -gt "25" ]; then
    eww update music='!Too Long Name!'
  fi
done
