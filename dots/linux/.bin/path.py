#!/usr/bin/env -S uv run --script

# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "rich",
# ]
# ///

# uv add --script path.py rich

import sys
from rich.console import Console

console = Console(force_terminal=True) # so color works even if you are piping data to python
paths = sys.stdin.read().split(":")

for i, path in enumerate([p for p in paths if "cache" not in p]):
    if i % 2 == 0:
        console.print(f"[bold red]{i}[/bold red] : [yellow]{path}[/yellow]")
    else:
        console.print(f"[bold red]{i}[/bold red] : [blue]{path}[/blue]")

