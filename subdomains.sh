#!/usr/bin/bash

if [[ -z "$*" ]]; then
  echo -e "Uso: $0 <URL>"
elif [[ ! -z "$*" ]]; then
  
  HORA="$(date +'%d/%m/%y | %T')"
  
  touch $1-subs.txt && echo -e "\n---[ + ]--- Omnisint:\n" >> $1-subs.txt
  OMN=$(curl "https://sonar.omnisint.io/subdomains/$1" -s -k | grep -oE "[a-zA-Z0-9._-]+\.$1" >> $1-subs.txt)
  echo -e "\n---[ + ]--- Anubis:\n" >> $1-subs.txt
  ANU=$(curl "https://jldc.me/anubis/subdomains/$1" -s -k | grep -oE "[a-zA-Z0-9._-]+\.$1" >> $1-subs.txt)
  echo -e "\n+--------------- Scan terminado $HORA ---------------+\n" >> $1-subs.txt
  
  # Tentando pegar o status code de cada linha do output file?? sou burro, deu beyblade, deu mt ruim
  
  #while IFS= read -r line; do
  #  echo -e "OMNISI" | curl -s -w '%{http_code}\n' $OMN -o /dev/null >> $1-code.txt
  #  echo -e "ANUBIS" | curl -sL -w '%{http_code}\n' $ANU -o /dev/null >> $1-code.txt
  #done
  #for i in "$1-subs.txt"; do
  #  cat $1-subs.txt | curl $i -s -w -k '%{http_code}\n' -o /dev/null >> $1-status.txt
  #done

  if [[ -f "$1-subs.txt" ]]; then
    echo -e "Arquivo com subdominios criado!"
  else
    echo -e "Nenhuma informação pode ser obtida!"
  fi
else
  false
fi
