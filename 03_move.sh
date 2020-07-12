#!/bin/sh

yyyymmdd=`date "+%Y%m%d"`

yyyymm01=`date "+%Y%m01"`

yyyymm=`date "+%Y%m"`

[ $# -eq 1 ] && yyyymm=`date -j -v-1m -f "%Y%m%d" "${yyyymm01}" "+%Y%m"`

yyyy=${yyyymm:0:4}

d=${yyyy}/${yyyymm}

branch_name=develop/move_${yyyymmdd}

# TODO 作成済みのブランチ確認とチェックアウト済みのブランチ確認

git fetch origin master

git checkout -b ${branch_name} origin/master

git push -u origin ${branch_name}

[ ! -e ${d} ] && mkdir -p ${d}

git mv ${yyyymm}*.md ${d}

git add ${d}/*

git commit -m "move ${yyyymm}*.md to ${d}" 

git push

