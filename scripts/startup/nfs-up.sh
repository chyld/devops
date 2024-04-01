#!/bin/bash

check_network_connectivity() {
    local test_ip="8.8.8.8"

    while true; do
        if ping -c 1 -W 1 $test_ip &> /dev/null; then
            echo "Network is up. Attempting NFS mount..."
            break
        else
            echo "Network is not up yet. Waiting..."
            sleep 1
        fi
    done
}

check_network_connectivity
mount -a -t nfs

