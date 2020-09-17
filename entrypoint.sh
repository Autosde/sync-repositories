#!/bin/sh

set -e


TOKEN=$1
UPSTREAM_REPO=$2


if [[ -z "$UPSTREAM_REPO" ]]; then
  echo "Missing \$UPSTREAM_REPO"
  exit 1
fi

echo "UPSTREAM_REPO=$UPSTREAM_REPO"
#echo "BRANCHES=$BRANCH_MAPPING"

#git config --unset-all http."https://github.com/".extraheader || :

#echo "Resetting origin to: https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY"
git remote set-url origin "https://'abc':$TOKEN@github.com/$GITHUB_REPOSITORY"

echo "Adding tmp_upstream $UPSTREAM_REPO"
git remote add tmp_upstream "$UPSTREAM_REPO"

echo "Fetching tmp_upstream"
git fetch tmp_upstream
git remote --verbose

echo "Pushing changings from tmp_upstream to origin"
#git push origin "refs/remotes/tmp_upstream/${BRANCH_MAPPING%%:*}:refs/heads/${BRANCH_MAPPING#*:}" --force

echo "Removing tmp_upstream"
git remote rm tmp_upstream
git remote --verbose
