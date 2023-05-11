#!/bin/sh

cd /opt/$API_PATH/ || exit

kill -KILL "$(cat pid.txt)"

rm -f pid.txt