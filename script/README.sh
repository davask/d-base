#/usr/bin/env bash

branch=${1};
parentBranch=${2};
rootDir=${3};
buildDir=${4};

#############
# README.md #
#############

echo "# dockerfile

see [FROM IMAGE README.md](https://github.com/davask/d-ubuntu)

### Base activation

## LABEL

> dwl.server.base=\"base:${branch}\"
" > ${rootDir}/README.md

echo "README.md generated with base:${branch}";
