#!/bin/bash
set -e

echo "Logging into Docker Hub..."
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

echo "Building Docker image..."
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

echo "Pushing Docker image..."
docker push ${IMAGE_NAME}:${IMAGE_TAG}

echo "✅ Docker image pushed successfully"
