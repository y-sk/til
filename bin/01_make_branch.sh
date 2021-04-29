#!/bin/bash

set -eu

[ $# -ne 1 ] && echo "ex) $0 [branch_name]" && exit 1

can_make_branch () {

  [ $# -ne 1 ] && echo "ex) ${FUNCNAME[0]} [branch_name]" && exit 1

  set +e
  found_branch=`git branch -a --format="%(refname:short)" | grep "^$1"`
  [ -n "${found_branch}" ] && echo "found $1" && exit 1
  set -e

}

sh_path=`dirname $0`

pushd ${sh_path}
pushd ../

git fetch -p

branch_name=feature/$1
remote_branch_name=origin/${branch_name}

can_make_branch ${branch_name}

can_make_branch ${remote_branch_name}

git checkout -b ${branch_name} origin/master

git push -u origin ${branch_name}

popd
popd
