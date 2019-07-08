#!/bin/sh

BLUECOLOR='\033[0;34;47m'
NOCOLOR='\033[0m' # No Color

defaultDockerImageName=$(cat ../Config/staging.properties | grep service_name | sed 's/.*service_name=//')
dockerImageName=''

echo "Command: ./deleteDockerImages.sh ${defaultDockerImageName}"

if [ -z "$1" ]
	then dockerImageName=$defaultDockerImageName
	else dockerImageName=$1
fi

echo -e "\e[0;34;47m--- Deleting old images ...\e[0m"

command="docker images *${dockerImageName}* -q "
echo $command
dockerImages=$(eval $command)

for f in $dockerImages;
do
    echo "Removing docker image: $f"
    docker rmi -f $f;
done
