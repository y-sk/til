#!/bin/sh

[ $# -ne 1 ] && echo "ex) $0 [keyword]" && exit 1

find . -type d -name '.git' -prune -o -type f -print | xargs grep -n --color "$1"
