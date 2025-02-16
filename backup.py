#!/usr/bin/python3

import os
import shutil
from pathlib import Path

def backup_dotfiles(dotfiles, backup_dir):
  backup_path = Path(backup_dir).expanduser()
  backup_path.mkdir(parents=True, exist_ok=True)
  
  for file in dotfiles:
    source = Path(file).expanduser()
    if not source.exists():
      print(f"Skipping: {source} (not found)")
      continue

    dest = backup_path / source.name
    if source.is_file():
      shutil.copy2(source, dest)
    elif source.is_dir():
      shutil.copytree(source, dest, dirs_exist_ok=True)
    
    print(f"Backed up: {source} -> {dest}")

if __name__ == "__main__":
  dotfiles = [
    "~/.zshrc",
    "~/.config/ghostty",
    "~/.config/helix",
    "~/.config/gitui"
  ]
  backup_dir = "./dotfiles"
  
  backup_dotfiles(dotfiles, backup_dir)
