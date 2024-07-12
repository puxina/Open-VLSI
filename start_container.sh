#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <container_name>"
    exit 1
fi

CONTAINER_NAME=$1
xhost +local:
docker start $CONTAINER_NAME && docker attach $CONTAINER_NAME
