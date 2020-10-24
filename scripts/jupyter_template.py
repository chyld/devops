#!/usr/bin/env python

# USAGE
# ------------------------
# jupyter_template.py m 10
# 10 copies of master.ipynb in the current working directory

import os
import sys
from uuid import uuid4
from shutil import copyfile

vi = sys.version_info
version = "Python v{}.{}.{}".format(vi.major, vi.minor, vi.micro)

proxy = sys.argv[1]
count = int(sys.argv[2])

templates = {'m' : 'master'}
template = templates[proxy]

source_dir = "/home/chyld/Code/devops/python/jupyter/templates/gold"
source_file = source_dir + "/master.ipynb"
target_dir = os.getcwd()

for i in range(count):
    fingerprint = uuid4().hex[-12:]
    target_file = f"{target_dir}/{template}.{fingerprint}.ipynb"
    copyfile(source_file, target_file)
    print("{} -> {}".format(source_file, target_file))

print(f"\n:: Using {version}")

