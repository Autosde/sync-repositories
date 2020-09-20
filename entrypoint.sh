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

echo "SYNC_FROM_REPO=$SYNC_FROM_REPO"
echo "SYNC_TO_REPO=$SYNC_TO_REPO"
echo "BRANCH=$BRANCH"
echo "TOKEN_TO_REPO=$TOKEN_TO_REPO"

git init

echo "Setting origin to: https://$TOKEN_TO_REPO@github.com/$SYNC_TO_REPO"
git remote add origin "https://$TOKEN_TO_REPO@github.com/${SYNC_TO_REPO}.git"

echo "Adding from_repo $SYNC_FROM_REPO"
git remote add from_repo "https://github.com/${SYNC_FROM_REPO}.git"
git remote -v

echo "Fetching from_repo"
git fetch from_repo master

echo "Pushing   to origin" with force
git push  origin "refs/remotes/from_repo/${BRANCH}:refs/heads/${BRANCH}" --force

