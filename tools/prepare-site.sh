#!/usr/bin/env bash
# Builds docs/index.md from README.md so the README is the site's start page.
# Rewrites repo-relative links so they work inside the MkDocs site.
set -euo pipefail
REPO_URL="https://github.com/SamirMohamed24/intune-endpoint-management-lab/blob/main"
sed -e 's#](docs/#](#g' \
    -e "s#](scripts/#](${REPO_URL}/scripts/#g" \
    README.md > docs/index.md
echo "docs/index.md generated from README.md"
