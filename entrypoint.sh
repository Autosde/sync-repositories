#!/bin/sh

set -e

TOKEN_TO_REPO=$1
SYNC_FROM_REPO=$2
SYNC_TO_REPO=$3
BRANCH=$4

if [[ -z "SYNC_FROM_REPO" ]]; then
  echo "Missing \SYNC_FROM_REPO"
  exit 1
fi

if [[ -z "SYNC_TO_REPO" ]]; then
  echo "Missing \SYNC_TO_REPO"
  exit 1
fi

echo "SYNC_FROM_REPO=SYNC_FROM_REPO"
echo "TOKEN_TO_REPO=$TOKEN_TO_REPO"
echo "BRANCH=$BRANCH"

pwd
ls -al
git init
#
git config --unset-all http."https://github.com/".extraheader || :
#
echo "Resetting origin to: https://$GITHUB_ACTOR:$TOKEN_TO_REPO@github.com/$SYNC_TO_REPO"
git remote set-url origin "https://$GITHUB_ACTOR:$TOKEN_TO_REPO@github.com/${SYNC_TO_REPO}.git"

#
#echo "Adding from_repo $SYNC_FROM_REPO"
git remote add from_repo "https://github.com/${SYNC_FROM_REPO}.git"
git remote -v
#
#echo "Fetching from_repo"
git fetch from_repo master

#
echo "Pushing  from 'from_repo' to origin" with force
git push --dry-run origin "refs/remotes/from_repo/${BRANCH}:refs/heads/${BRANCH}" --force
#
#echo "Removing tmp_upstream"
#git remote rm tmp_upstream
# git remote --verbose
