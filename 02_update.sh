#!/bin/sh

yyyymmdd=`date "+%Y%m%d"`

f=${yyyymmdd}.md

[ "$1" != "" ] && f=${1}.md

[ ! -e ${f} ] && echo "not found ${f}" && exit 1

modified=`git status ${f} | grep -E "(modified|new file)"`
[ "${modified}" != "" ] \
&& git pull \
&& git add ${f} \
&& git commit -m "update ${f}"

modified=`git status ${yyyymmdd} | grep -E "(modified|new file)"`
[ "${modified}" != "" ] \
&& git pull \
&& git add ${yyyymmdd} \
&& git commit -m "update ${yyyymmdd}"


