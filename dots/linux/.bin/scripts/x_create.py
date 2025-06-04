#!/usr/bin/env -S uv run --script

# /// script
# requires-python = ">=3.13"
# dependencies = [
# ]
# ///

# uv add --script FILE.py numpy pandas

#!/usr/bin/env python3

import os
import random
from datetime import datetime

def generate_hex_directory():
    hex_number = ''.join(random.choices('0123456789abcdef', k=3))
    date_string = datetime.now().strftime('%Y%m%d%H%M%S')
    final_dir = "__" + hex_number + "-" + date_string
    os.mkdir(final_dir)
    print("directory created:", final_dir)

if __name__ == "__main__":
    generate_hex_directory()

