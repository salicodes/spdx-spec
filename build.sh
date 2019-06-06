#!/bin/bash
set -eu
rm *.pdf -f
for BRANCH in `git branch --list|sed 's/\*//g'`;
  do
    git checkout $BRANCH
    # git fetch
    cd $BRANCH/chapters/
    pandoc *.md -o example.pdf --from markdown --template spdx-pdf-template --table-of-contents
  done
git checkout master;
