#!/bin/#!/usr/bin/env bash
set -eu
rm *.pdf -f
pandoc *.md -o example.pdf --from markdown --template spdx-pdf-template --table-of-contents
