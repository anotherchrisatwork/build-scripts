#!/bin/bash
mkdir /tmp/done.$$
for i in `cat all_projects.txt` ; do
  pushd $i
  j=`echo $i | tr '/' '_'`
  ( find . -name node_modules -prune -exec rm -rf {} \; ; touch /tmp/done.$$/$j ) &
  popd
done
count=`cat all_projects.txt | wc -l`
while [ `/bin/ls /tmp/done.$$ | wc -l` != $count ] ; do
  sleep 5
done
rm -rf /tmp/done.$$
