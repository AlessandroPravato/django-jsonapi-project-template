#!/bin/bash

set -e

function print_error() {
  echo "$1"
  exit 1
}

CONTAINER_REGISTRY_URL=$1

CONTAINER_REGISTRY_PROJECT=$2

IMAGE_VERSION=$3

[ $# != 3 ] && print_error "Usage: $0 <CONTAINER_REGISTRY_URL> <CONTAINER_REGISTRY_PROJECT> <IMAGE_VERSION>"
[ -z "$CONTAINER_REGISTRY_URL" ] && print_error "CONTAINER_REGISTRY_URL is empty"
[ -z "$CONTAINER_REGISTRY_PROJECT" ] && print_error "CONTAINER_REGISTRY_PROJECT is empty"
[ -z "$IMAGE_VERSION" ] && print_error "IMAGE_VERSION is empty"

IMAGE_NAME="${CONTAINER_REGISTRY_URL}/${CONTAINER_REGISTRY_PROJECT}/django-project"
IMAGE_TAG="base-${IMAGE_VERSION}"

export DOCKER_DEFAULT_PLATFORM=linux/amd64
docker build -t $IMAGE_NAME:$IMAGE_TAG -f docker/django-production-base.Dockerfile .
docker push $IMAGE_NAME:$IMAGE_TAG

echo "${IMAGE_NAME}:${IMAGE_TAG} build and pushed."
