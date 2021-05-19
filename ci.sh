#!/bin/zsh

set -o pipefail

# remove aws associated binaries from pre-built image
echo "initialising environment..."
rm /usr/local/bin/aws /usr/local/bin/aws_completer 

# setup
echo "setting up environment..."
make setup 

# checking envrionment
echo "checking environment..."
make check

# check docker cli is available
echo "checking docker cli..."
docker --version >/dev/null && echo $?
