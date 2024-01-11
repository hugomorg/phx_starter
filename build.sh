#!/bin/bash

set -e

if [ "$APP" = "" ]
then
  echo "Usage: please provide APP as env var"
  exit 1
fi

UTC_TIMESTAMP=$(date -u +%Y%m%dT%H%M%S)

CONTAINER_IMAGE="$APP-build"
CONTAINER_NAME="$CONTAINER_IMAGE-$UTC_TIMESTAMP"
# TODO make configurable
RELEASE_VERSION="0.1.0"
RELEASE_TAR="$APP-$RELEASE_VERSION.tar.gz"

echo "=> Building image $CONTAINER_IMAGE"

docker build -t $CONTAINER_IMAGE .

echo "=> Starting Docker container"

docker run --name $CONTAINER_NAME -dt $CONTAINER_IMAGE > /dev/null

echo "=> Copying release from $RELEASE_TAR to /tmp"

docker cp "$CONTAINER_NAME:/app/$RELEASE_TAR" /tmp/

echo "=> Removing Docker container"

docker stop $CONTAINER_NAME > /dev/null
docker rm $CONTAINER_NAME > /dev/null

echo "=> Done"
