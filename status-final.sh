#!/usr/bin/bash

if [[ -z "$*" ]]; then
  echo -e "Uso: $0 <URL>"
elif [[ ! -z "$*" ]]; then
  
  touch url
  #echo -e "\n---[ + ]--- Omnisint:\n" >> $1-subs.txt
  OMN=$(curl "https://sonar.omnisint.io/subdomains/$1" -s -k | grep -oE "[a-zA-Z0-9._-]+\.$1" >> url)
  #echo -e "\n---[ + ]--- Anubis:\n" >> $1-subs.txt
  ANU=$(curl "https://jldc.me/anubis/subdomains/$1" -s -k | grep -oE "[a-zA-Z0-9._-]+\.$1" >> url)
  #echo -e "\n+--------------------------------------------------------------------------------+\n" >> url

  doit() {
      url="$1"
      #uri="$2"
      urlstatus=$(curl -o /dev/null -k -s --head --write-out  '%{http_code}' "${url}" --max-time 5 ) &&
      echo "URL: $url CODE: $urlstatus"
  }
  export -f doit

  parallel -j200 doit :::: url >> resp


  #doit() {
  #  URLS=$(cat $OMN | cat $ANU)
  #  #uri="$2"
  #  urlstatus=$(curl -o /dev/null -k -s --head --write-out  '%{http_code}' "${URLS}" --max-time 5 ) &&
  #  echo "URL: $ULRS CODE: $urlstatus"
  #}
  #export -f doit

  #parallel -j200 doit :::: url >> resp


  if [[ -f "url" ]]; then
    echo -e "Arquivo com subdominios criado!"
  else
    echo -e "Nenhuma informação pode ser obtida!"
  fi
else
  false
fi

