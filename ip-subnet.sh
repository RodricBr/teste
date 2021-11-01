#!/usr/bin/bash

[[ -z "$*" ]] &&
  RESPO=$(ip addr show | grep -e /24 | awk '{print $2}')
  echo -e "\n>>> Subnet:\n"
  fping -g -4 $RESPO -a 2>/dev/null
  echo -e "\n>>> Host:\n"
  fping -g 10.0.0.0/24 -a 2>/dev/null


#if [[ "$(ip addr show | grep -e /24 | awk '{print $2}')" == "192.*" ]]; then
#  echo -e "Começa com 192."
#elif [[ "$(ip addr show | grep -e /24 | awk '{print $2}')" == "10.*" ]]; then
#  echo -e "Começa com 10."
#else
#  false
#fi
