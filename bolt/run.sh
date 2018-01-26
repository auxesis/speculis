#!/bin/bash

set -e

alias readlink=greadlink

BASEDIR="$(readlink -f $(pwd)/$(dirname $0)/..)"
ARTIFACT_DIR="$BASEDIR/artifacts"
REPO="github.com/boltdb/bolt"
NORMALISED_REPO="$(echo $REPO | sed 's/\//_/g')"
DOTFILE="$NORMALISED_REPO.dot"
PDF="$NORMALISED_REPO.pdf"
IGNORE_PREFIXES="$REPO/vendor/"

# Fetch
export GOPATH="$HOME"
go get -u -v $REPO

# Graph
cd $GOPATH/src/$REPO
godepgraph -s $REPO | tee $DOTFILE

# Visualise
cat $DOTFILE | dot -Tpdf -o $PDF

# Store artifacts
cp $DOTFILE $ARTIFACT_DIR
cp $PDF $ARTIFACT_DIR
