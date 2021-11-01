doit() {
    url="$1"
    uri="$2"
    urlstatus=$(curl -o /dev/null --insecure --silent --head --write-out  '%{http_code}' "${url}""${uri}" --max-time 5 ) &&
    echo "$url  $urlstatus $uri"
}
export -f doit

parallel -j200 doit :::: url uri >> urlstatus.txt

# teste
