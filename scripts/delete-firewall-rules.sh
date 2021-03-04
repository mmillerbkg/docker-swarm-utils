#!/bin/bash

if [ -z "$1" ]; then
    echo "No IP supplied. Please try again!"
    else 
        echo "Deleting UFW rules for $1! Stand by..."
        ufw delete allow proto tcp from "$1" to any port 2377
        ufw delete allow from "$1" to any port 7946
        ufw delete allow proto udp from "$1" to any port 4789
fi

echo "Goodbye!"