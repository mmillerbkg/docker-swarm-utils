#!/bin/bash

if [ -z "$1" ]; then 
    echo "Local IP not specified. Please specify and try again!"

    else
        cat docker-swarm-nodes.txt | while read line; do
            echo "Adding rules for $line"
            if [ "$line" == "$1" ]; then 
                echo "Skipping local IP"
                else
                    ufw allow from "$line" to "$1" proto esp
            fi
        done
        ufw reload
fi

