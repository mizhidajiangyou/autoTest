#!/usr/bin/env bash
d="testDisk"

# 判断参数磁盘名称是否存在
if [ x$d != x ]
then
    disk=$d
    echo "test disk:" $d
else
    echo "error! please enter disk!"
    exit 0
fi

#参数开头若为a，通过软连接测试卷;若参数为e,则测试urlConfig中的entireDisk；为s则正常测试磁盘
case ${disk:0:1} in

s)
    filename="/dev/"${disk}
    ;;
a)
    disk=${disk:1}
    cd /dev/zvol/p${disk}
    filename="/dev/"`ls -al | grep v | awk '{print $11}'|cut -d "/" -f3 | tr '\n' ':' | sed "s!:!:/dev/!g"`
    filename=${filename:0:0-6}
    echo "test zvol : "${filename}
    cd -
    ;;
e)
    cd ../Config/
    filename="/dev/"`cat performance.py | grep entireDisk | cut -d "\"" -f2 | tr " " ":" | sed "s!:!:/dev/!g"`
    cd -
    ;;
*)
    echo "error! please enter true disk! first string is a for test zvol"
    exit 0
    ;;
esac


fio -filename=${filename} -iodepath=64 -direct=1  -thread   -size=100%  -numjobs=64  -time_based -runtime=1800 -startdelay=30 -group_reporting  -ioengine=ioway -bs=block -rw=rwway -name=reportname >> output