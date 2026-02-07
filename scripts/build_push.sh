#!/bin/bash
set -e

IMAGE_NAME="dockerhub-username/jenkins-demo"
IMAGE_TAG="latest"

echo "Logging into Docker Hub"
docker login -u "$DOCKER_USER" -p "$DOCKER_PASS"

echo "Building Docker image"
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

echo "Pushing Docker image"
docker push ${IMAGE_NAME}:${IMAGE_TAG}

echo "Docker image pushed successfully"

