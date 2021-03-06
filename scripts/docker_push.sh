#!/usr/bin/env bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build --build-arg BUILD_COMMIT=$TRAVIS_COMMIT --target production -t humanconnection/nitro-backend:latest $TRAVIS_BUILD_DIR/backend
docker build --build-arg BUILD_COMMIT=$TRAVIS_COMMIT --target production -t humanconnection/nitro-web:latest $TRAVIS_BUILD_DIR/webapp
docker push humanconnection/nitro-backend:latest
docker push humanconnection/nitro-web:latest
