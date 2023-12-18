#!/bin/sh

cd $API_PATH || exit

# Stop the Core service
CORE_PID=$(cat /pid/core_pid.txt 2>/dev/null)
if [ -n "$CORE_PID" ]; then
    kill -KILL "$CORE_PID"
    rm -f /pid/core_pid.txt
fi

# Stop the Report service
REPORT_PID=$(cat /pid/report_pid.txt 2>/dev/null)
if [ -n "$REPORT_PID" ]; then
    kill -KILL "$REPORT_PID"
    rm -f /pid/report_pid.txt
fi

# Stop the Reader service
READER_PID=$(cat /pid/reader_pid.txt 2>/dev/null)
if [ -n "$READER_PID" ]; then
    kill -KILL "$READER_PID"
    rm -f /pid/reader_pid.txt
fi

# Stop the Integration service
INTEGRATION_PID=$(cat /pid/integration_pid.txt 2>/dev/null)
if [ -n "$INTEGRATION_PID" ]; then
    kill -KILL "$INTEGRATION_PID"
    rm -f /pid/integration_pid.txt
fi
