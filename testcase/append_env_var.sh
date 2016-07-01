#!/bin/sh

set -e

mk="$@"

cat <<EOF > Makefile
VAR += PASS
override BAR += PASS
\$(info VAR=\$(VAR),\$(origin VAR))
\$(info BAR=\$(BAR),\$(origin BAR))
all:
EOF

VAR=FAIL ${mk} BAR=FAIL 2> /dev/null
