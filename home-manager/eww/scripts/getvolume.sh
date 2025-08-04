#!/usr/bin/env bash

vol="$(pulsemixer --get-volume | awk '{print $1}')";
icon="#";

if [ $vol -lt 20 ]; then
  icon="󰕿"
elif [ $vol -lt 70 ]; then
  icon="󰖀"
else
  icon="󰕾"
fi

eww update volumedyn="$vol";
eww update volicon="$icon";

echo $vol
echo $icon

timerfile="/tmp/volumeboxers_eww.pid"


start_timer () {
  if [ -f "$timerfile" ]; then
    kill "$(cat $timerfile)"
    rm $timerfile
  fi
  (
    sleep 2;
    eww close volumebox;
  ) &
  echo $! > $timerfile
}

if [ "$(eww active-windows | grep volumebox)" ]; then
  start_timer;
else
  eww open volumebox;
  start_timer;
fi









