#!/bin/bash

XAUTHPROTO=.
SERVERNUM=1
if [ -z "$AUTHFILE" ]; then
    XVFB_RUN_TMPDIR="$(mktemp -d -t $PROGNAME.XXXXXX)"
    # Create empty file to avoid xauth warning
    AUTHFILE=$(tempfile -n "$XVFB_RUN_TMPDIR/Xauthority")
fi

LD_PRELOAD=/usr/local/lib/faketime/libfaketime.so.1 FAKETIME_NO_CACHE=1 DISPLAY=:$SERVERNUM XAUTHORITY=$AUTHFILE google-chrome-stable --no-sandbox --disable-setuid-sandbox
