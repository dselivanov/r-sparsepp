#!/bin/bash
# Example:
# update.sh 1.22

version=$1

git submodule update --remote
cd inst/include
git checkout $version
cd -
printf "### $(date +%F)\n- update to upstream v$version\n\n" | cat - NEWS.md > NEWS.tmp
mv NEWS.tmp NEWS.md
sed -i "s/Version:.*$/Version: $version/g" DESCRIPTION
sed -i "s/Date:.*$/Date: $(date +%F)/g" DESCRIPTION
git add . 
git commit -m "Update to upstream v$version"
git tag v$version 
