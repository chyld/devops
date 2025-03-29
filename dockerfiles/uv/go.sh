#!/bin/bash

docker build -t uv .
docker run -it --rm uv

