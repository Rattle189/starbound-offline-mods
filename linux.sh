#!/bin/bash
 
shopt -s failglob

# Default SteamCMD directory: "$HOME/Steam/steamapps/workshop/content/211820"
workshop="-- Point to Workshop directory --"
mods=$PWD/mods
 
mkdir -p "$mods" || exit
 
for pathname in "$workshop"/*/*.pak; do
    name=${pathname#"$workshop"/}
    name=${name%/*}-${name#*/}
 
    ln -s "$pathname" "$mods/$name"
done
