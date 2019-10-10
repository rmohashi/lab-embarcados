#!/bin/bash

GITDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$*" ]] ; then
	docker build -t rmohashi/lab-embarcados --build-arg EDITORPKG="$*" $GITDIR/docker
else
	docker build -t rmohashi/lab-embarcados $GITDIR/docker
fi
