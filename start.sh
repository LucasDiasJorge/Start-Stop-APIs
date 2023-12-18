#!/bin/sh

API_PATH="/opt/apiv2/"
CORE_JAR="core.jar"
REPORT_JAR="report.jar"
READER_JAR="reader.jar"
INTEGRATION_JAR="integration.jar"

cd "$API_PATH" || exit

# Create the output directory if it doesn't exist yet
mkdir -p output || exit

# Create the pid directory if it doesn't exist yet
mkdir -p pid || exit

# Get the current date in the format YYYY-MM-DD
CURRENT_DATE=$(date +"%Y-%m-%d")

# Redirect the output of each command to a log file
>output/core/output_$CURRENT_DATE.log
>output/report/output_$CURRENT_DATE.log
>output/reader/output_$CURRENT_DATE.log
>output/integration/output_$CURRENT_DATE.log

# Run the Core JAR
nohup java -jar -Xmx400m "$CORE_JAR" --server.port=8889 --spring.datasource.url=jdbc:postgresql://localhost:5432/db --spring.datasource.username=postgres --spring.datasource.password=password > "output/core/output_$CURRENT_DATE.log" 2>&1 &
echo $! > pid/core_pid.txt

# Run the Report JAR
nohup java -jar -Xmx1000m "$REPORT_JAR" --server.port=8890 --spring.datasource.url=jdbc:postgresql://localhost:5432/db --spring.datasource.username=postgres --spring.datasource.password=password > "output/report/output_$CURRENT_DATE.log" 2>&1 &
echo $! > pid/report_pid.txt

# Run the Reader JAR
nohup java -jar -Xmx400m "$READER_JAR" --server.port=8891 --spring.datasource.url=jdbc:postgresql://localhost:5432/db --spring.datasource.username=postgres --spring.datasource.password=password > "output/reader/output_$CURRENT_DATE.log" 2>&1 &
echo $! > pid/reader_pid.txt

# Run the Integration JAR
nohup java -jar -Xmx400m "$INTEGRATION_JAR" --server.port=8892 --spring.datasource.url=jdbc:postgresql://localhost:5432/db --spring.datasource.username=postgres --spring.datasource.password=password > "output/integration/output_$CURRENT_DATE.log" 2>&1 &
echo $! > pid/integration_pid.txt