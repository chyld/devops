#!/usr/bin/env -S uv run --script

# /// script
# requires-python = ">=3.14"
# dependencies = [
# ]
# ///

import os
import sys
import random
from datetime import datetime
from pathlib import Path

def get_name():
    script_dir = Path(__file__).parent
    file_path = script_dir / 'names.txt' # "/" is overridden to join paths

    with open(file_path, 'r') as file:
        lines = file.readlines()

    name = random.choice(lines).strip().lower()
    return name

def generate_hex_directory():
    name = get_name()
    hex_number = ''.join(random.choices('0123456789abcdef', k=3))
    date_string = datetime.now().strftime('%Y%m%d.%H%M')
    final_dir = sys.argv[1] + "." + name + "." + hex_number + "." + date_string

    print(final_dir)

if __name__ == "__main__":
    generate_hex_directory()

