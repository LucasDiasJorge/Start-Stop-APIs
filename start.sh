#!/bin/sh

cd /opt/$API_PATH/ || exit

# Crie o diretório de saída se ainda não existir
mkdir -p /output || exit

# Obtenha a data atual no formato YYYY-MM-DD
CURRENT_DATE=$(date +"%Y-%m-%d")

# Run the Core JAR
nohup java -jar $CORE_JAR > "/output/core/output_$CURRENT_DATE.log" 2>&1 &
echo $! > /pid/core_pid.txt

# Run the Report JAR
nohup java -jar $REPORT_JAR > "/output/report/output_$CURRENT_DATE.log" 2>&1 &
echo $! > /pid/report_pid.txt

# Run the Reader JAR
nohup java -jar $READER_JAR > "/output/reader/output_$CURRENT_DATE.log" 2>&1 &
echo $! > /pid/reader_pid.txt

# Run the Integration JAR
nohup java -jar $INTEGRATION_JAR > "/output/integration/output_$CURRENT_DATE.log" 2>&1 &
echo $! > /pid/integration_pid.txt
