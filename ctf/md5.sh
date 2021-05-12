#!/bin/bash

#HTB MD5 web challenge

#Solution 1 (By me)
# curl -i -c "cookies.txt" -k -X GET http://159.65.82.100:30856/ > "page.html"; #
# grep h3 "page.html" | cut -d'>' -f4 | cut -d'<' -f1 > "text.txt"; #
# hash=$(echo -n $(cat "text.txt")| md5sum | cut -d' ' -f1); #
# curl -k -X POST -b "cookies.txt" --data "hash=${hash}" http://159.65.82.100:30856/ --output - #

#Solution 2 (Designed by my friend @aeaktt  )
url="http://159.65.82.100:30856/"
curl -d hash=$(curl -c "cookies.txt" $url | egrep -o "[[:alnum:]]{20}" | tail -n1 | tr -d '\n' | md5sum | cut -d' ' -f1) -b "cookies.txt" $url | egrep -o "HTB{.*}"