#!/usr/bin/env -S uv run --script

# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "rich",
# ]
# ///

import os
import random
from datetime import datetime
from pathlib import Path
from rich import print

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
    final_dir = "GENERIC." + name + "." + hex_number + "." + date_string

    os.makedirs(f"{final_dir}/project")
    os.chdir(f"{final_dir}/project")
    os.system("touch README.md")
    os.system("git init")
    os.system("git add .")
    os.system("git commit -m 'Initial commit'")

    print(f"\n\nproject created: [bold red underline]{final_dir}[/bold red underline]")

if __name__ == "__main__":
    generate_hex_directory()

