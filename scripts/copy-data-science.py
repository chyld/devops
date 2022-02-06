#!/usr/bin/env python

import os

cwd = os.getcwd()
source = "/home/chyld/Code/devops/templates/data-sci"
command = f"cp -r {source}/* {cwd}"
os.system(command)
