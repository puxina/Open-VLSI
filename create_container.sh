#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <container_name>"
    exit 1
fi

CONTAINER_NAME=$1
TAG="arch-mkix:vlsi"

docker run --volume $(pwd):$(pwd) \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --workdir $(pwd) \
    --name $CONTAINER_NAME \
    --device=/dev/dri:/dev/dri \
    --net=host -it \
    --detach $TAG
