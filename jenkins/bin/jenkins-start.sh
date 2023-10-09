#!/bin/bash

# This script could be symlinked from another location.
THIS_DIR=$(readlink -f $(dirname $(readlink -f $0)))
export TMP={THIS_DIR}/var/tmp

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export PATH=$JAVA_HOME/bin:$PATH

export JENKINS_HOME="/opt/tools/jenkins/var/home"
java -jar ${THIS_DIR}/../jenkins.war
