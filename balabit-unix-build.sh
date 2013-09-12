#!/bin/sh

cmd=$1
shift
case "$cmd" in
  build-exclude-list|dist-exclude-list|prepare-dist)
    echo "out autom4te.cache"
    ;;
  bootstrap)
    sh ./autogen.sh
    find -name libtool -o -name ltmain.sh | xargs sed -i -e "s,'file format pe-i386.*\?','file format \(pei\*-i386\(\.\*architecture: i386\)\?|pe-arm-wince|pe-x86-64\)'," -e 's,cmd \/\/c,,'
    ;;
  configure)
    CFLAGS="-g -O2" LDFLAGS="-g" ./configure $@
    ;;
  make)
    make $@
    ;;
  *)
    echo "Unknown command: $cmd"
    exit 1
    ;;
esac

# vim: ts=2 sw=2 expandtab
