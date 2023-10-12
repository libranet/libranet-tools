# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# https://kafka.apache.org/documentation.html

SCALA_VERSION=2.13
KAFKA_VERSION=3.5.1
URL="https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"

.PHONY: install
install: create-dirs download-kafka make-instance make-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p var
	@ mkdir -p var/downloads
	@ mkdir -p var/instances
	@ mkdir -p var/tmp


.PHONY: download-kafka
download-kafka:
	curl -sSf ${URL} --output var/downloads/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz
	- cd var/downloads/ && tar -xzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz


.PHONY: make-instance
make-instance:
#	- mv var/downloads/neo4j-community-${KAFKA_VERSION} var/instances/${KAFKA_VERSION}


.PHONY: make-symlinks
make-symlinks:
#	- cd var/instances && ln -fs ${KAFKA_VERSION} current
#	- ln -fs var/instances/current/bin bin
#	- ln -fs var/instances/current/conf etc
#	- cd var && ln -fs instances/current/logs log

	# @echo -e "Create symlinks in ${HOME}/bin/"
	# - cd ~/bin  && ln -fs $(realpath var/instances/${KAFKA_VERSION}/bin/neo4j)
	# - cd ~/bin  && ln -fs $(realpath var/instances/${KAFKA_VERSION}/bin/neo4j-admin)
