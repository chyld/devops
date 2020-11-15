#!/usr/bin/env python

# play.py <project> <template>
# play.py (default or random) will autogenerate a directory name
# this script is being called from a *bash* function
# that is initialized in the ~/.zshrc file

import os
import sys
import uuid
from shutil import copytree

# fills in the list, just in case not enough arguments are provided
_, project, template, *_ = sys.argv + ['default', 'default']

# change the directory to *this* directory
abs_path = os.path.dirname(os.path.abspath(__file__))
os.chdir(abs_path)

# base directories
template_dir = '/home/chyld/Code/devops/templates'
play_dir = '/home/chyld/Play'

# rename project if it was not supplied
if project in ['default', 'random']:
    project = 'tmp.' + uuid.uuid4().hex[-10:]

# construct the destination directory
dst = f'{play_dir}/{project}'

# move to project if it exists
if os.path.isdir(dst):
    print(dst)
    exit(1)

# rename template if provided is not found
src = f'{template_dir}/{template}'
if not os.path.isdir(src):
    src = f'{template_dir}/generic'

# copy the template over to the ~/Play directory
copytree(src, dst)

# send destination to bash and exit
print(dst)
exit(2)

