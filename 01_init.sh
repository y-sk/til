#!/bin/sh

yyyymmdd=`date "+%Y%m%d"`

f=${yyyymmdd}.md

[ -e ${f} ] && echo "exist ${f}" && exit

echo "# ${yyyymmdd}" > ${f}

git pull

git add ${f}

git commit -m "init ${f}" 

git push



