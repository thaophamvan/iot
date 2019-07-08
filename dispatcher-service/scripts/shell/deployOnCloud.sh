#!/bin/sh

set -e

BLUECOLOR='\033[0;34;47m'
NOCOLOR='\033[0m' # No Color

DEPLOYMENT_ENVIRONMENT="staging"

ENVIRONMENT=$(cat ../Config/${DEPLOYMENT_ENVIRONMENT}.properties | grep environment | sed 's/.*environment=//')
SERVICE_NAME=$(cat ../Config/${DEPLOYMENT_ENVIRONMENT}.properties | grep service_name | sed 's/.*service_name=//')
NUMBER_OF_INSTANCES=$(cat ../Config/${DEPLOYMENT_ENVIRONMENT}.properties | grep number_of_instances | sed 's/.*number_of_instances=//')

DOCKER_IMAGE_NAME=${SERVICE_NAME}
DOCKER_IMAGE_TAG=`date +%Y%m%d_%H%M%S`

IBM_DOCKER_REGISTRY_URL="uk.icr.io"
IBM_DOCKER_REGISTRY_NAMESPACE="emea-mobile-${DEPLOYMENT_ENVIRONMENT}"

echo -e "${BLUECOLOR}--- Delete docker images ...${NOCOLOR}"
command="./deleteDockerImages.sh ${DOCKER_IMAGE_NAME}"
echo $command
eval $command

echo -e "${BLUECOLOR}--- Create Docker Image ...${NOCOLOR}"
command="./createDockerImage.sh  ${DOCKER_IMAGE_NAME} ${DOCKER_IMAGE_TAG}"
echo $command
eval $command

DOCKER_IMAGE_FULL_NAME="${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
DOCKER_CLOUD_IMAGE_NAME="${IBM_DOCKER_REGISTRY_URL}/${IBM_DOCKER_REGISTRY_NAMESPACE}/${DOCKER_IMAGE_FULL_NAME}"

echo -e "\e[0;34;47m--- Pushing application image to IBM Bluemix ...\e[0m"
echo -e "\e[0;34;47m--- Tagging image...\e[0m"
command="docker tag ${DOCKER_IMAGE_FULL_NAME} ${DOCKER_CLOUD_IMAGE_NAME}"
echo $command
eval $command

echo -e "\e[0;34;47m--- Pushing image...\e[0m"
command="docker push ${DOCKER_CLOUD_IMAGE_NAME}"
echo $command
eval $command

command="sed 's|DOCKER_CLOUD_IMAGE_NAME|${DOCKER_CLOUD_IMAGE_NAME}|g; s|ENVIRONMENT|${ENVIRONMENT}|g; s|SERVICE_NAME|${SERVICE_NAME}|g; s|NUMBER_OF_INSTANCES|${NUMBER_OF_INSTANCES}|g; ' ../Kubernetes/configmap.${DEPLOYMENT_ENVIRONMENT}.template | kubectl apply -f -"
echo $command
eval $command

command="sed 's|DOCKER_CLOUD_IMAGE_NAME|${DOCKER_CLOUD_IMAGE_NAME}|g; s|ENVIRONMENT|${ENVIRONMENT}|g; s|SERVICE_NAME|${SERVICE_NAME}|g; s|NUMBER_OF_INSTANCES|${NUMBER_OF_INSTANCES}|g; ' ../Kubernetes/service.template | kubectl apply -f -"
echo $command
eval $command

command="sed 's|DOCKER_CLOUD_IMAGE_NAME|${DOCKER_CLOUD_IMAGE_NAME}|g; s|ENVIRONMENT|${ENVIRONMENT}|g; s|SERVICE_NAME|${SERVICE_NAME}|g; s|NUMBER_OF_INSTANCES|${NUMBER_OF_INSTANCES}|g; ' ../Kubernetes/deployment.template | kubectl apply -f -"
echo $command
eval $command

echo -e "${BLUECOLOR}--- Delete docker images ...${NOCOLOR}"
command="./deleteDockerImages.sh ${DOCKER_IMAGE_NAME}"
echo $command
eval $command

echo -e "${BLUECOLOR}--- Clean up docker...${NOCOLOR}"
command="./cleanupDocker.sh"
echo $command
eval $command