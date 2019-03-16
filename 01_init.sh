#!/bin/sh

yyyymmdd=`date "+%Y%m%d"`

f=${yyyymmdd}.md

[ -e ${f} ] && echo "exist ${f}" && exit

# TODO 作成済みのブランチ確認とチェックアウト済みのブランチ確認
git checkout -b develop/${yyyymmdd} origin/master

git push -u origin develop/${yyyymmdd}

echo "# ${yyyymmdd}" > ${f}

git pull

git add ${f}

git commit -m "init ${f}" 

git push


