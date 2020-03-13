#!/bin/sh

tgt_dir="$1"
[ -z "$tgt_dir" ] && echo -e "Usage: $0 <tgt_dir>\nTell me where to put the links" && exit


for script in $(find "$(dirname "$0")/scripts/" -executable -type f);do
  linkname=$(echo $script | cut -f '3-' -d '/' | sed 's/\//-/g')
  echo "$linkname" "$script"
  ln -s "$(realpath $script)" "$tgt_dir/$linkname"
done
