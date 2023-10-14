#!/bin/bash

# see https://enterpriseknowledge.atlassian.net/wiki/spaces/EKG/pages/1437728773/gitignore
git rm -r --cached .
git add .
git commit -m "Drop files from .gitignore"
