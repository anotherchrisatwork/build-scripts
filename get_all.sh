#!/bin/bash
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
rm -f all.packages.txt all.packages.txt.uns
for i in `cat all_projects.txt` ; do
  echo "Doing $i"
  pushd $i
  perl -ne 'if (/\}/) { $state = 0; } if ($state == 1 && /"([^"]+)":/) { print $1, "\n"; } if (/dependencies|devDependencies/i) { $state = 1; }' < package.json >> ../all.packages.txt.uns
  popd
done
sort -u < all.packages.txt.uns > all.packages.txt
rm -f all.packages.txt.uns
