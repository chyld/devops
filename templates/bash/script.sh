#!/bin/bash

set -x                              # debugging
set -euo pipefail                   # check any errors including unset variables and errors in pipelines
trap exitf EXIT                     # cleanup before script exit

func() {
    trap returnf RETURN             # cleanup before function returns
    local var                       # declare variables separately
    var=$(ls > /dev/null; pwd)      # use subprocesses
    echo "var: $var"                # always quote variables
}

returnf() {
    echo "function has returned"
}

exitf() {
    echo "script has exited"
}

func

