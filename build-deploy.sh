#!/usr/bin/env bash

set -e

BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

IMAGE_NAME="pteslenko/packer-qemu"
VERSION=$(grep FROM ${BASE}/Dockerfile | cut -d: -f2)

echo "Building docker images for packer ${VERSION}..."
docker build --build-arg VCS_REF=$(git rev-parse --short HEAD) \
             --build-arg BUILD_DATE=$(date -u +”%Y-%m-%dT%H:%M:%SZ”) \
             -f "${BASE}/Dockerfile" -t ${IMAGE_NAME}:${VERSION} .
docker tag ${IMAGE_NAME}:${VERSION} ${IMAGE_NAME}:latest

echo "Uploading docker images for packer ${VERSION}..."
docker push ${IMAGE_NAME}:${VERSION}
docker push ${IMAGE_NAME}:latest
