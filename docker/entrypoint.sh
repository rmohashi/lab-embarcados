#!/bin/bash
set -e

SRC=/home/student
if [ ! -f $SRC/qemu/Makefile ] ; then
    fail "Mount a qemu tree volume under $SRC/qemu"
fi
cd $SRC/qemu

./configure --target-list=arm-softmmu,arm-linux-user
make

export MAKEFLAGS

if [[ "$*" ]] ; then
    su student -c "env PATH=$PATH $*"
else
    su - student
fi
