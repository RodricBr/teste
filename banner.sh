#!/usr/bin/env bash

# Requer um arquivo chamado urls

ARQ="urls"
HORA="$(date +'%d/%m/%y | %T')"

echo -e "\n\n+----------[ Verificação Iniciada $HORA ]----------+"

while IFS= read -r line; do

  echo -e "\n>>> URL: $line"
  HTTP_=$(echo "http://$line")
  HTTPS=_$(echo "https://$line")
  RESHTTP=$(echo | curl -s -I $HTTP_ --connect-timeout 3 | grep -e Server:)
  RESHTTPS=$(echo | curl -s -I $HTTPS_ --connect-timeout 3 | grep -e Server:)

  if [ -z "$RESHTTP" ]; then
    false
  else
    echo -e "+ Resposta em HTTP:\n$RESHTTP"
  fi

  if [ -z "$RESHTTPS" ]; then
    false
  else
    echo -e "+ Resposta em HTTPS:\n$RESHTTPS"
  fi

done < "$ARQ"
