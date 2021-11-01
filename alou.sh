doit() {
    url="$1"
    #uri="$2"
    urlstatus=$(curl -o /dev/null -k -s --head --write-out  '%{http_code}' "${url}" --max-time 5 ) &&
    echo "URL: $url CODE: $urlstatus"
}
export -f doit

parallel -j200 doit :::: url >> resp
