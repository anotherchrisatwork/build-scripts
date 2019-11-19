#!/usr/bin/bash
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export TAIKO_SKIP_CHROMIUM_DOWNLOAD=true
rm -rf everything
mkdir everything
cd everything
yarn init -y
for i in `cat ../all.packages.txt` ; do
  npm add $i --save
done
