#!/usr/bin/env bash

out=0
case $1 in
  "cpu")
    "$out"=0
  ;;
  "mem")
    "$out"=1
  ;;
  "temp")
    "$out"=2
  ;;
  *)
    "$out"=3
  ;;
esac

eww -c ../ update graph_choice="$out"
