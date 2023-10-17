#!/usr/bin/env bash

set -e

# Specify your GitHub repository information
GITHUB_USER="Dprof-in-tech"
GITHUB_REPO="simple_shell"

set -x

# See also ".mailmap" for how email addresses and names are deduplicated
cat > "AUTHORS" <<- EOF
    # File @generated by simple_shell/generate-authors.sh. DO NOT EDIT.
    # This file lists all contributors to the repository.
    # See simple_shell/generate-authors.sh to make modifications.

     $(curl -s "https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPO}/contributors" | jq -r '.[] | "\(.login) <\(if .html_url then " (@\(.html_url | split("/")[3]))" else "" end)"')
EOF
