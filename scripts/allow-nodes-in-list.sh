#!/bin/bash

if [ -z "$1" ] then
        echo "Local IP not defined. Adding extra rules"
        cat docker-swarm-nodes.txt | while read line; do
            echo $line
            ufw allow proto tcp from "$line" to any port 2377
            ufw allow from "$line" to any port 7946
            ufw allow proto udp from "$line" to any port 4789
            ufw allow from "$line" to any proto esp
        done
    else
        LOCAL_IP=$1

        cat docker-swarm-nodes.txt | while read line; do
            if [ "$1" == "$line" ]; then 
                echo "Skipping own IP."
                else
                    echo "Updating IP: $line"
                    ufw allow proto tcp from "$line" to "$1" port 2377
                    ufw allow from "$line" to any "$1" 7946
                    ufw allow proto udp from "$line" to "$1" port 4789
                    ufw allow from "$line" to "$1" proto esp
            fi
        done 
fi

ufw reload