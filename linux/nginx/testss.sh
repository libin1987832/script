#!/bin/sh
set -e -u
FNAME="/tmp/whatever.$$"
echo "$@" > "$FNAME"
#id >> "$FNAME"
set >> "$FNAME"
#exec /media/git/git/git-http-backend "$@"
exec /usr/lib/git-core/git-http-backend "$@"
