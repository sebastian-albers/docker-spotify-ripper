#!/bin/bash

set -euxo pipefail

# login to Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# push latest amd64 and arm32v7 images
docker push "sebastianalbers/spotify-ripper:latest-amd64"
docker push "sebastianalbers/spotify-ripper:latest-arm32v7"

# read version from Docker container
version=$(./read-version.sh amd64)

# push multi-arch image
./push-multi-arch-image.sh "${version}"

