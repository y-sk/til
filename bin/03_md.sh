#/bin/bash

set -eu

[ $# -ne 1 ] && echo "ex) $0 [suffix]" && exit  -1

sh_path=`dirname $0`

pushd ${sh_path}
pushd ../

dst_date=`date "+%Y%m%d"`

suffix=$1 

dst=${dst_date}_${suffix}

dst_found=`find . -type d -name "${dst}"`
[ "${dst_found}" != "" ] && echo "exist directory ${dst_found}" && exit

mkdir ${dst}

head_line="${dst_date} ${suffix}"
echo "# ${head_line}" > ${dst}/00_${suffix}.md