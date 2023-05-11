#!/bin/sh

cd /opt/$API_PATH/ || exit

nohup java -jar $YOUR_JAR.jar > /dev/null 2>&1&

echo $! > pid.txt