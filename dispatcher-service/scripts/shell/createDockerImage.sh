#!/bin/sh

BLUECOLOR='\033[0;34;47m'
NOCOLOR='\033[0m' # No Color

echo "Command: ./createDockerImage.sh image_name image_tag"

defaultDockerImageName=$(cat ../Config/staging.properties | grep service_name | sed 's/.*service_name=//')
dockerImageName=''
defaultDockerImageTag='latest'
dockerImageTag=''

if [ -z "$1" ]
	then dockerImageName=$defaultDockerImageName
	else dockerImageName=$1
fi

if [ -z "$2" ]
	then dockerImageVersion=$defaultDockerImageTag
	else dockerImageVersion=$2
fi

DOCKER_IMAGE_FULL_NAME=${dockerImageName}:${dockerImageVersion}
echo -e "${BLUECOLOR}--- Building docker image name: ${DOCKER_IMAGE_FULL_NAME} ...${NOCOLOR}"

command="docker build -f ../Docker/Dockerfile -t ${DOCKER_IMAGE_FULL_NAME} ../../"
echo $command
eval $command

echo -e "${BLUECOLOR}--- Listing images ...${NOCOLOR}"
command="docker images | grep ${dockerImageName}"
echo $command
eval $command