#!/usr/bin/env python

import os
import uuid

cwd = os.getcwd()
source = "/home/chyld/Code/devops/templates/data-sci"

hexid = uuid.uuid4().hex[-4:]
command = f"mkdir -p {cwd}/{hexid}.ds"
os.system(command)

command = f"cp -r {source}/* {cwd}/{hexid}.ds"
os.system(command)
