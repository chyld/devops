#!/usr/bin/env bash

# open web browser first, because the web server will hang
xdg-open "http://localhost:8080/"

# cache for only 1 second
npx http-server -c1

