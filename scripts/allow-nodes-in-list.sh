#!/bin/bash

cat docker-swarm-nodes.txt | while read line; do
    echo $line
    ufw allow proto tcp from "$line" to any port 2377
    ufw allow from "$line" to any port 7946
    ufw allow proto udp from "$line" to any port 4789
done

ufw reload