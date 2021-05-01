#!/usr/bin/bash
base_dir="/usr/lib/"

do_patch() {
  if [[ -d "$1" && -d "$1/venv" ]]; then
    sudo directory="$1" python do_patch.py
  else
    echo skipping $1
  fi
}

# not sure about other versions
# feel free to create pull request if other versions worked
for i in python3.{8,9}; do
  do_patch "$base_dir$i"
done

# ? I'm confused whether to use pwd or dir ?
echo -e "source $(dirs)/prompt.sh" >> ~/.bashrc
