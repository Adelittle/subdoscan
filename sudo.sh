#!/bin/bash
#phpMyAdmin Mass Scanner By Adelittle
LISTS=$1

if [[ ! -f ${LISTS} ]]; then
	echo "ERROR: ${LISTS} not found"
	echo "usage: bash $0 list.txt"
	exit
fi

for SITE in $(cat $LISTS);
do 
RESULT=$(curl -kls "https://api.indoxploit.or.id/domain/${SITE}/" | jq -r ".data.subdomains[]");
echo "$RESULT" >> hasil.txt
echo "scan subdomain ${SITE} done"
done
