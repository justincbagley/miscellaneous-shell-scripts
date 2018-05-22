#!/bin/sh

gzipkeep() {
    if [ -f "$1" ] ; then
        gzip -c -- "$1" > "$1.gz"
    fi
}

gzipkeep

exit 0

