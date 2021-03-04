#!/bin/bash

if [ -z "$1" ]; then
    echo "No IP provided. Try again!"
    else
        echo "Updating UFW for IP: $1 Stand by."
        ufw allow proto tcp from "$1" to any port 2377
        ufw allow from "$1" to any port 7946
        ufw allow proto udp from "$1" to any port 4789 
fi

echo "Goodbye!"