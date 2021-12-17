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
df = pd.read_csv('elements.csv')
element = df.Element.sample().values[0]
symbol = df[df.Element == element].Symbol.values[0].lower().strip()
atomic_number = df[df.Element == element].AtomicNumber.values[0]
element = element.lower().strip()
hexid = uuid.uuid4().hex[-3:]
current = datetime.now().strftime("%Y%m%d")
project_dir = f"{hexid}-{symbol}-{element}-{current}"

# construct the destination directory
dst = f'{x_dir}/{project_dir}'
os.mkdir(dst)

# send destination to bash and exit
print(dst)
exit(2)
