#!/bin/sh

[ $# -ne 1 ] && echo "ex) $0 [keyword]" && exit 1

find . -type f | xargs grep -n --color "$1"
