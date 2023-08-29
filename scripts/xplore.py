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
home = os.environ['HOME']
base_dir = f'{home}/Xplore'

# generate name of folder
greek = pd.read_csv('data/greek.txt', header=None).sample().values[0][0].strip()
solar = pd.read_csv('data/solar.txt', header=None).sample().values[0][0].strip()
element = pd.read_csv('data/elements.csv').Element.sample().values[0].strip()
hexid = uuid.uuid4().hex[:3]
current = datetime.now().strftime("%Y-%m%d")

# put it all together
project_dir = f"{element}-{greek}-{solar}-{current}.{hexid}"

# construct the destination directory
full_path = f'{base_dir}/{project_dir}'
os.mkdir(full_path)

# send destination to bash and exit
print(full_path)
exit(3)
