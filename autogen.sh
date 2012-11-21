#!/bin/sh

[ -d m4 ] || mkdir m4
autoreconf -if

sed -i -e "s, cmd //c, sh -c," ltmain.sh
