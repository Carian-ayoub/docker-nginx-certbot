#!/bin/bash

IFS=' ' read -r -a PLATFORMS <<< "$PLATFORMS"
IFS=' ' read -r -a STAGES <<< "$STAGES"

for i in "${PLATFORMS[@]}"
do
    for j in "${STAGES[@]}"
    do
        echo $i.$j
        envsubst < /etc/nginx/conf.d/nginx-template | sed -e 's/§/$/g' > /etc/nginx/conf.d/$i.$j.conf
	    sed -i "s/%PLATFORM%/$i/g" /etc/nginx/conf.d/$i.$j.conf
	    sed -i "s/%STAGE%/.$j/g" /etc/nginx/conf.d/$i.$j.conf
    done
    envsubst < /etc/nginx/conf.d/nginx-template | sed -e 's/§/$/g' > /etc/nginx/conf.d/$i.conf
    sed -i "s/%PLATFORM%/$i/g" /etc/nginx/conf.d/$i.conf
    sed -i "s/%STAGE%//g" /etc/nginx/conf.d/$i.conf
done

echo "Goodbye!"