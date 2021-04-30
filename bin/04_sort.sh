#!/bin/bash

set -eu

sh_path=`dirname $0`

pushd ${sh_path}
pushd ../

yyyymmdd=`date "+%Y%m%d"`

yyyymm01=`date "+%Y%m01"`

yyyymm=`date "+%Y%m"`

m=0
[ $# -eq 1 ] && m=$1
yyyymm=`date --date "${yyyymm01} ${m} months ago" "+%Y%m"`
yyyy=${yyyymm:0:4}

mv_cnt=`ls -1 | grep ^${yyyymm} | wc -l`
[ ${mv_cnt} -eq 0 ] && echo "no target ${yyyymm}*" && exit 1

dst=${yyyy}/${yyyymm}

./bin/01_make_branch.sh move_`date "+%Y%m%d_%H%M%S"`

[ ! -e ${dst} ] && mkdir -p ${dst}

git mv ${yyyymm}* ${dst} \
&& git add ${dst}/* \
&& git commit -m "move ${yyyymm}* to ${dst}" 

git push

popd
popd