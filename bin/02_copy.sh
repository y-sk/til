#/bin/bash

set -eu

find_src () {

  [ $# -ne 1 ] && echo "ex) ${FUNCNAME[0]} [find str]" && exit 1

  local src=`find . -type f -regextype posix-basic -regex "$1" | sort -t'/' -k2,2nr -k3,3nr -k4,4nr | head -n 1`

  echo $src

}

sh_path=`dirname $0`

pushd ${sh_path}
pushd ../

dst_date=`date "+%Y%m%d"`
dst=${dst_date}.md

suffix=""
[ $# -eq 1 ] && suffix=$1 && dst=${dst_date}_${suffix}.md

dst_found=`find . -type f -name "${dst}"`
[ "${dst_found}" != "" ] && echo "exist file ${dst_found}" && exit

src=`find_src "[0-9/.]*_${suffix}.md"`

[ "${src}" == "" ] && src=`find_src "[0-9/.]*.md"`

[ "${src}" == "" ] && echo "not found src" && exit

cp -v "${src}" "${dst}"

# 1行目の日付を変更
sed -i"" -e "1d" ${dst}
head_line=${dst_date}
[ "$suffix" != "" ] && head_line="${dst_date} ${suffix}"
sed -i"" -e "1i# ${head_line}" ${dst}

popd
popd
