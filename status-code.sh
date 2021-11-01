#!/usr/bin/bash

# Requer um arquivo chamado 'urls'
# no mesmo diretório do status-code.sh
# contendo as urls a serem analisadas

# Variável que recebe o arquivo 'urls'
ARQ="urls"
HORA="$(date +'%d/%m/%y | %T')"
echo "+----------[ Resultados $HORA ]----------+"

# Internal Field Separator(IFS) para evitar espaços em branco no output
while IFS= read -r line; do

  WEBHTTP=$(echo "http://$line")
  WEBHTTPS=$(echo "https://$line")
  HTTP=$(echo | curl -s -w '%{http_code}\n' $WEBHTTP -o /dev/null)
  HTTPS=$(echo | curl -sL -w '%{http_code}\n' $WEBHTTPS -o /dev/null)
  # awk -F (field separator)
  DOMINIO=$(echo $line | awk -F[/:] '{print $1}')
  IP=$(echo | nslookup $DOMINIO | awk '/^Address/{n++; if (n==2) {print $2}; if (n==3){print $2}; if (n==4){exit}}')
  
  echo -e "\n+URL: $line\n+IP/s:\n$IP\n+STATUS: $HTTP(HTTP) e $HTTPS(HTTPS)"
  
# Lendo o conteúdo da variável das urls
done < "$ARQ"
