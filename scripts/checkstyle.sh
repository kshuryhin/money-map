#!/usr/bin/env bash

##################################################################################
#### Runs checkstyle on modified Java files (based on pre-commit-config.yaml) ####
##################################################################################
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CHECKSTYLE_FILE="$DIR/checkstyle/checkstyle.xml"
FILES_TO_COMMIT=$(git diff --cached --name-only --diff-filter=d | grep ".java$")

if [ -z "$FILES_TO_COMMIT" ]
then
    exit 0
fi

checkstyle -c $CHECKSTYLE_FILE $FILES_TO_COMMIT

case $? in
"127")
    echo "Please install checkstyle with 'brew install checkstyle', and then try to commit again"
    exit 127;;
"0")
    exit 0;;
*)
    exit
