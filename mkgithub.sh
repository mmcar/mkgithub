#!/usr/bin/env bash

# create remote repo using GitHub API
# init local git repo if that hasn't been done
# should be run within the project folder
# assumes remote origin does not already exist

USER="mmcar"

if [ ! -d .git ]; 
then
  git init
  git add .
  git commit -m "First commit"
fi

REPO=$(basename `git rev-parse --show-toplevel`)
echo "Creating github remote for repo: $REPO"
curl -u "$USER" https://api.github.com/user/repos -d "{\"name\":\"$REPO\"}"
echo "Setting https://github.com/$USER/$REPO to remote"
git remote add origin https://github.com/$USER/$REPO
git remote -v
echo "Pushing repo"
git push origin master
