#!/bin/bash

git config --global alias.lg1 "log --format=oneline"
git config --global alias.st "status"
git config --global alias.pulr "pull --rebase"
git config --global alias.b "branch"
git config --global alias.cia "commit --amend"

# Push to Gerrit for code review
git config --global alias.pug "push origin HEAD:refs/for/master"
