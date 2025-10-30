#!/bin/sh
printf '\033c\033]0;%s\a' Endostellar_online
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Endostellar_O.x86_64" "$@"
