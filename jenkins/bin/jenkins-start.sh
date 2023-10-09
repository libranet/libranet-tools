#!/bin/bash

# This script could be symlinked from another location.
THIS_DIR=$(readlink -f $(dirname $(readlink -f $0)))

export JAVA_HOME=/path/to/your/java-11-directory
export PATH=$JAVA_HOME/bin:$PATH
export TMP={THIS_DIR}/var/tmp

java -jar var/jenkins.war
