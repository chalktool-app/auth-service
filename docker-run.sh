#!/usr/bin/env bash

sudo docker run -d --name auth-service  --restart always auth-service -p 80:8080