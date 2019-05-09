#!/bin/sh

yyyymmdd=`date "+%Y%m%d"`

f=${yyyymmdd}.md

[ "$1" != "" ] && f=${1}.md

[ ! -e ${f} ] && echo "not found ${f}" && exit 1

modified=`git status ${f} | grep modified`

[ "${modified}" == "" ] && echo "no change ${f}" && exit 1

echo ${modified}

git pull

git add ${f}

git commit -m "update ${f}" 
