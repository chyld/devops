#!/usr/bin/env python

import os
import sys
from shutil import move

try:
    new_name = sys.argv[1]
except BaseException:
    exit(1)

curr_dir = os.getcwd()
base_dir = os.path.dirname(curr_dir)
new_dir = f"{base_dir}/{new_name}"

if os.path.exists(new_dir):
    exit(2)

move(curr_dir, new_dir)
print(new_dir)
exit(0)
