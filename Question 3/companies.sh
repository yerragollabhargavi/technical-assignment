#!bin/bash

if [ $# -ne 1 ]; then
    echo "Usage ./companies.sh url"
    exit 1
fi

url=$1

curl -s "#url" | awk -F',' 'NR>1 { print $1, " ", $8, " ", $11}' | sort -t',' -k3,n | column -t -s ','

