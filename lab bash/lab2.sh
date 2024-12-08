#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

INTERFACE="eth0"
DURATION=10
OUTPUT_FILE="tcpdump_output.txt"

echo "Starting tcpdump scan on $INTERFACE for $DURATION seconds..."

tcpdump -i $INTERFACE -w $OUTPUT_FILE -G $DURATION tcp -W 1

if [ $? -eq 0 ]; then
    echo "Scan completed successfully"
else
    echo "Scan failed"
fi

echo "Scan completed. Output saved to $OUTPUT_FILE"

// rm $OUTPUT_FILE