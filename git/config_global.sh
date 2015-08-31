#!/bin/bash

# checks whether a binary exists in your PATH
bin_in_path () {
    bin=$1
    for path in $(echo $PATH | tr ':' '\n'); do
    if [ -x "$path/$bin" ]; then
        return 0
    fi
    done
    return 1
}

# Absolute path to this script
SCRIPT_DIR=$( cd $(dirname ${BASH_SOURCE[0]}) && pwd )

# git lg1 format is: 'short_hash title (author, commit_date)'
git config --global alias.lg1 "log --format='%Cred%h %Creset%s %Cblue(%an, %cr)'"
git config --global alias.st "status"
git config --global alias.b "branch"
git config --global alias.delb "branch -d"
git config --global alias.fdelb "branch -D"
git config --global alias.newb "checkout -b"
git config --global alias.cia "commit --amend"
git config --global alias.com "checkout master"
git config --global alias.r3 "rebase -i HEAD~3"
git config --global alias.r5 "rebase -i HEAD~5"
git config --global alias.r10 "rebase -i HEAD~10"

# Setup a file that contains exclude patterns for every git repositories
# on this computer. This means that you don't have to manually add '.DS_Store'
# to every single '.gitignore' files.
cp $SCRIPT_DIR/.gitignore_global ~/
git config --global core.excludesfile ~/.gitignore_global

# Setup Sublime Text as the default editor.
# Make sure that `subl` in in your path.
# For Mac OS X users: http://www.sublimetext.com/docs/3/osx_command_line.html
bin_in_path 'subl'
if [ $? == 0 ]; then
    git config --global core.editor "subl -n -w"
fi
