#!/bin/bash
HOST="http://image.andreaseliassen.com/"

TOKEN="XIWebCA-B3ppZ8xCFfRfzk0cHweqxeRBQPL8BXVsBsrYKW9ptd2y8UcMKm9x8GjgCiGKyjnvvMhRZ0YstYUXybdUiVsIFXuNyv_GgW9WFSI1"
for ((x=0; x<356; x++)); do
  for ((y=0; y<401; y++)); do

    COLOR="$(./pixel.py $(pwd)/cash.jpg $x $y)"
    
    NAME=$(cat names.txt | sort -R | head -n 1)
    #COLOR=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 6)
    #COLOR="$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 4)ff"
    #COLOR="ff$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 4)"
    #COLOR="ff$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 2)ff"

    echo "$NAME  -- $COLOR"
    RESPONSE=$(curl -s --output /dev/null -w "%{http_code}" -XPOST -H 'Cookie: __RequestVerificationToken=q5IL6oao6oM_BsNUv7Zz05G_tQ12JIqMwOcRRQFVUgKVNRkIoahQV3Jh07WlQ00jqO6mOnrd28xWc0uDyl9JbjUsXe1WDEkZYSY-jprDMoU1; _gat=1; _ga=GA1.2.1424136150.1412779486' -H "Accept-Encoding: gzip,deflate" -H "Accept-Language: en-GB,en-US;q=0.8,en;q=0.6,de;q=0.4,nl;q=0.2" -H "Content-Type: application/x-www-form-urlencoded" -H "Origin: http://image.andreaseliassen.com" -H "Referer: http://image.andreaseliassen.com/" -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36" $HOST --data "userName=$NAME&__RequestVerificationToken=$TOKEN&colorHex=%23$COLOR")
    echo "status $RESPONSE"
  done
done
