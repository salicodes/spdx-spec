#!/bin/bash

set -e

TARGET = "/path/to/output/destinaion"
REPO = "/path/to/local/repo"
BRANCH = "master"

while read oldrev newrev ref
do
  if [[ $ref = refs/heads/"$BRANCH" ]];
    then
            echo "Ref $ref received. Deploying ${BRANCH} branch to production..."
            git --work-tree="$TARGET" --git-dir="$REPO" checkout -f
    else
            echo "Ref $ref received. Doing nothing: only the ${BRANCH} branch may be deployed on this server."
    fi

done

cd $REPO/chapters
git pull
./build.sh
cp -p *.pdf $TARGET
