#!/bin/zsh
LAST_COMMIT=`git log -1 --pretty=%B`
LAST_COMMIT="${LAST_COMMIT// /_}"
LAST_COMMIT="$(echo -e "${LAST_COMMIT}" | tr -d '[:space:]')"
echo "Creating branch named ${LAST_COMMIT}"
git checkout -b $LAST_COMMIT
