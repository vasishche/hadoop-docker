#!/bin/bash
echo "Starting services on headnode..."
rm -f /tmp/hadoop*.pid
$HADOOP_HOME/bin/hdfs --daemon start namenode && \
$HADOOP_HOME/bin/yarn --daemon start resourcemanager
echo "Done."
trap "stopnode" HUP INT QUIT TERM
stopnode() {
    return_value=$?
    echo "Stopping services on headnode..."
    $HADOOP_HOME/bin/hdfs --daemon stop namenode && \
    $HADOOP_HOME/bin/yarn --daemon stop resourcemanager
    echo "Done."
    exit $return_value
}

# This doesn't work with docker-compose
# echo "[hit enter key to exit] or run 'docker stop <container>'"
# read
# stopnode

tail -f /dev/null
