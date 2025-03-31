#!/bin/bash

docker build -t uv .
docker run -v "$(pwd)/src":/home/bob/src -it --rm uv

