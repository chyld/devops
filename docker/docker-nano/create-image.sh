#!/bin/bash

docker system prune -f
docker build --no-cache --progress plain -t nano:latest .

