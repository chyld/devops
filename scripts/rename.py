#!/usr/bin/env python

import os
import sys
from shutil import move

# get the name from the input arguments
try:
    new_name = sys.argv[1]
except BaseException:
    exit(1)

# compute the current and destination folder
curr_dir = os.getcwd()
base_dir = os.path.dirname(curr_dir)
new_dir = f"{base_dir}/{new_name}"

# exit if destination folder exists
if os.path.exists(new_dir):
    exit(2)

# perform the move
move(curr_dir, new_dir)
print(new_dir)
exit(0)

