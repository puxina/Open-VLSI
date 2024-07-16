#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {clean|full}"
    exit 1
fi

case $1 in
    clean)
        DOCKERFILE="./Dockerfile.arch-mkix-clean"
		echo "This is a clean image of Open-VLSI (only contains the tools). Remember to install the PDKs."
        ;;
    full)
        DOCKERFILE="./Dockerfile.arch-mkix-full"
        ;;
    *)
        echo "Invalid option: $1"
        echo "Usage: $0 {clean|full}"
        exit 1
        ;;
esac

TAG="arch-mkix:vlsi"

echo "Building Docker image using $DOCKERFILE"
docker build -t $TAG -f $DOCKERFILE .

echo "Removing dangling images"
docker rmi $(docker images -aq --filter "dangling=true" --no-trunc)

echo "Removing specific images (archlinux)"
docker rmi $(docker images -q archlinux 2>/dev/null) # Handle case if no such images exist

docker images -a
