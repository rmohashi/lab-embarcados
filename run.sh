#!/bin/bash

IMAGE="$(docker ps -q -f ancestor=rmohashi/lab-embarcados)"

if [[ $IMAGE ]] ; then
	docker exec -ti $IMAGE /bin/bash entrypoint.sh
else
	if [[ "$1" ]] ; then
		SRCDIR="$( cd $1 && pwd )"
	else
		GITDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
		SRCDIR="$GITDIR/src"
	fi

	if [[ "$2" ]]; then
		docker run --rm -ti -v "$GITDIR/qemu":/home/student/qemu -v "$SRCDIR":/home/student/src --device="$2":/dev/ttyS0 rmohashi/lab-embarcados
	else
		docker run --rm -ti -v "$GITDIR/qemu":/home/student/qemu -v "$SRCDIR":/home/student/src rmohashi/lab-embarcados
	fi
fi
