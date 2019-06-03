#!/bin/bash
set -eu
rm *.pdf -f
pandoc *.md -o specification.pdf --from markdown --template spdx-pdf-template --table-of-contents
