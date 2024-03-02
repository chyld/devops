#!/bin/bash

set -x  # debugging
set -e  # exit immediately if a command exits with a non-zero status
set -u  # treat unset variables as an error when substituting
set -o pipefail  # check for errors in pipelines

my_func() {
    # get arguments
    local arg1="$1"
    # use local and subprocesses
    local variable=$(pwd)
    # quote variables
    echo "$variable"
    # braces with string concatenation
    echo "${variable}_test"
}

my_func

