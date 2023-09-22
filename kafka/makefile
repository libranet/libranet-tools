# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# https://kafka.apache.org/documentation.html 

KAFKA_VERSION=4.4.19
URL="https://dlcdn.apache.org/kafka/3.4.0/kafka_2.13-3.4.0.tgz"


.PHONY: install
install: create-dirs download-kafka make-instance make-symlinks


.PHONY: create-dirs
create-dirs:
	- mkdir -p var
	- mkdir -p var/downloads
	- mkdir -p var/instances
	- mkdir -p var/tmp


.PHONY: download-kafka
download-kafka:
	- wget --no-clobber ${URL} -O var/downloads/neo4j-community-${KAFKA_VERSION}-unix.tar.gz
	- cd var/downloads/ && tar -xzf neo4j-community-${KAFKA_VERSION}-unix.tar.gz


.PHONY: make-instance
make-instance:
	- mv var/downloads/neo4j-community-${KAFKA_VERSION} var/instances/${KAFKA_VERSION}


.PHONY: make-symlinks
make-symlinks:
	- cd var/instances && ln -fs ${KAFKA_VERSION} current
	- ln -fs var/instances/current/bin bin
	- ln -fs var/instances/current/conf etc
	- cd var && ln -fs instances/current/logs log

	# @echo -e "Create symlinks in ${HOME}/bin/"
	# - cd ~/bin  && ln -fs $(realpath var/instances/${KAFKA_VERSION}/bin/neo4j)
	# - cd ~/bin  && ln -fs $(realpath var/instances/${KAFKA_VERSION}/bin/neo4j-admin)
