#!/usr/bin/env bash

./gradlew

docker build -t auth-service .
