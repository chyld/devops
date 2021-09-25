#!/usr/bin/env python

import os
import uuid
import pandas as pd

# change the directory to *this* directory
# so i can read the elements.csv file
abs_path = os.path.dirname(os.path.abspath(__file__))
os.chdir(abs_path)

# base directories
x_dir = '/home/chyld/X'

# generate name of folder
df = pd.read_csv('elements.csv')
element = df.Element.sample().values[0]
symbol=df[df.Element == element].Symbol.values[0]
hexid = uuid.uuid4().hex[-10:]
project_dir = f"{element.lower().strip()}-{symbol.lower().strip()}-{hexid}.x"

# construct the destination directory
dst = f'{x_dir}/{project_dir}'
os.mkdir(dst)

# send destination to bash and exit
print(dst)
exit(2)

