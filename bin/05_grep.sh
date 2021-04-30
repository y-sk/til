#!/bin/bash

[ $# -ne 1 ] && echo "ex) $0 [keyword]" && exit 1

set -eu

sh_path=`dirname $0`

pushd ${sh_path}
pushd ../

find . -type d -name '.git' -prune -o -type f -print | xargs grep -n --color "$1"
