#!/bin/bash
#
# Usage:
#   > merge-from-master.sh
#   > merge-from-master.sh main

set -e  # direct exit upon error


FROM=${1:-master}
# FROM="master"


echo -e "== git checkout $FROM =="
git checkout "$FROM"


echo -e "\n\n== git pull =="
git pull


echo -e "\n\n== git checkout - =="
git checkout -


echo -e "\n\n== git merge $FROM =="
git merge "$FROM"
