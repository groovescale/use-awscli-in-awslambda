#!/bin/bash
adir="$1"
shift
cd "$adir"
exec "$@"
