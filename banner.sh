#!/usr/bin/env bash

# Requer um arquivo chamado urls
# contendo as urls a serem analisadas

AQUIV="urls"
HORA="$(date +'%d/%m/%y | %T')"

echo -e "\n\n+----------[ Verificação Iniciada $HORA ]----------+"

while IFS= read -r line; do

  echo -e "\n>>> URL: $line"
  
  WEBHTTP=$(echo "http://$line")
  WEBHTTPS=$(echo "https://$line")
  RESULTHTTP=$(echo | curl -s -I $WEBHTTP --connect-timeout 3 | grep -e Server:)
  RESULTHTTPS=$(echo | curl -s -I $WEBHTTPS --connect-timeout 3 | grep -e Server:)
  
  if [ -z "$RESULTHTTP" ]; then
    false
  else
    echo -e "+ Resposta em HTTP:\n$RESULTHTTP"
  fi

  if [ -z "$RESULTHTTPS" ]; then
    false
  else
    echo -e "+ Resposta em HTTPS:\n$RESULTHTTPS"
  fi

done < "$AQUIV"
