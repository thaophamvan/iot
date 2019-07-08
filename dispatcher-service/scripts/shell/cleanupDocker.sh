#!/bin/sh

BLUECOLOR='\033[0;34;47m'
NOCOLOR='\033[0m' # No Color

echo -e "${BLUECOLOR}--- Delete stopped containers ...${NOCOLOR}"
stoppedDockerContainers=$(docker ps --filter "status=exited" -q)
for f in $stoppedDockerContainers;
do
    echo "Removing stopped container: $f"
    docker rm $f;
done

echo -e "${BLUECOLOR}--- Delete dangling images ...${NOCOLOR}"
danglingImages=$(docker images --quiet --filter "dangling=true")
for f in $danglingImages;
do
    echo "Removing dangling image: $f"
    docker rmi $f;
done
