#!/usr/bin/bash

# Requer um arquivo chamado urls
# contendo as urls a serem analisadas

ARQ="urls"
HORA="$(date +'%d/%m/%y | %T')"
echo "+----------[ Resultados $HORA ]----------+"

while IFS= read -r line; do
  WEBSITEHTTP=$(echo "http://$line")
  WEBSITEHTTPS=$(echo "https://$line")
  HTTP=$(echo | curl -s -w "%{http_code}\n" $WEBSITEHTTP -o /dev/null)
  HTTPS=$(echo | curl -sL -w "%{http_code}\n" $WEBSITEHTTPS -o /dev/null)
  domain=$(echo $line | awk -F[/:] '{print $1}')
  IP=$(echo | nslookup $domain | awk '/^Address/{n++; if (n==2) {print $2}; if (n==3){print $2}; if (n==4){exit}}')
  
  echo -e "\n+URL: $line\n+IP/s:\n$IP\n+STATUS: $HTTP(HTTP) e $HTTPS(HTTPS)"
done < "$ARQ"
