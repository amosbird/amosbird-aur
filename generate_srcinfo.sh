#!/usr/bin/env sh

cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

for d in *
do
    if [ -d $d ]
    then
        pushd $d
        makepkg --printsrcinfo > .SRCINFO
        popd
    fi
done
