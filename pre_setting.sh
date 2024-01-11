export API_PATH=/opt/apiv2

export CORE_JAR=core.jar

export READER_JAR=reader.jar

export REPORT_JAR=report.jar

export INTEGRATION_JAR=integration.jar

cd "$API_PATH" || exit

# Create the output directory if it doesn't exist yet
mkdir -p output
mkdir -p core || mkdir -p reader || mkdir -p report || mkdir -p integration

# Create the pid directory if it doesn't exist yet
mkdir -p pid || exit