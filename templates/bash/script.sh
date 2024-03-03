#!/bin/bash

set -x                  # debugging
set -euo pipefail       # check any errors including unset variables and errors in pipelines
trap exitf EXIT

func() {
    trap returnf RETURN
}

returnf() {
    echo "function has returned"
}

exitf() {
    echo "script has exited"
}

func

