#!/usr/bin/env bash

# Requer um arquivo chamado urls

input="urls"
HORA="$(date +'%d/%m/%y | %T')"

echo -e "\n\n+----------[ Verificação Iniciada $HORA ]----------+"

while IFS= read -r line; do

  echo -e "\n>>> URL: $line"
  WEBSITEHTTP=$(echo "http://$line")
  WEBSITEHTTPS=$(echo "https://$line")
  RESULTSERVERHTTP=$(echo | curl -s -I $WEBSITEHTTP --connect-timeout 3 | grep -e Server:)
  RESULTSERVERHTTPS=$(echo | curl -s -I $WEBSITEHTTPS --connect-timeout 3 | grep -e Server:)
  #Resultados apresentados em tela e salvos em uma lista BANNER-LIST.txt
  if [ -z "$RESULTSERVERHTTP" ]; then
    false
  else
    echo -e "+ Resposta em HTTP:\n$RESULTSERVERHTTP"
  fi

  if [ -z "$RESULTSERVERHTTPS" ]; then
    false
  else
    echo -e "+ Resposta em HTTPS:\n$RESULTSERVERHTTPS"
  fi

done < "$input"
