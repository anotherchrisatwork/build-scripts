#!/bin/bash
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
rm -rf /home/chris/.cache/yarn/v4
for i in `cat all_projects.txt` ; do
  echo "Doing $i"
  pushd $i
  npm install >& install.out
  popd
done
