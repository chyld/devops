#!/usr/bin/env python

import os
import uuid
import pandas as pd
from datetime import datetime

# change the directory to *this* directory
# so i can read the elements.csv file
abs_path = os.path.dirname(os.path.abspath(__file__))
os.chdir(abs_path)

# base directories
x_dir = '/home/chyld/X'

# generate name of folder
greek, unicode = pd.read_csv('data/greek.txt').sample().values.flatten()[0].split('-')
adjective = pd.read_csv('data/adjectives.txt', header=None)[0].sample().values[0].strip()
scientist = pd.read_csv('data/scientists.txt', header=None)[0].sample().values[0].strip()
element = pd.read_csv('data/elements.csv').Element.sample().values[0].lower().strip()
name = pd.read_csv('data/baby-names.csv').name.sample().values[0].lower().strip()
hexid = uuid.uuid4().hex[-4:]
current = datetime.now().strftime("%Y-%m%d")

# put it all together
project_dir = f"{adjective}-{name}-{current}.{hexid}"

# construct the destination directory
dst = f'{x_dir}/{project_dir}'
os.mkdir(dst)

# send destination to bash and exit
print(dst)
exit(2)
