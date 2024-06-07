#!/bin/bash 
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

podman build -f $SCRIPTPATH/Containerfile -t tt4-env