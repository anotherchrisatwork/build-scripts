#!/bin/bash
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export TAIKO_SKIP_CHROMIUM_DOWNLOAD=true
for i in `cat all_projects.txt` ; do
  echo "Doing $i"
  pushd $i
  yarn audit > audit.out 2>&1
  popd
done
