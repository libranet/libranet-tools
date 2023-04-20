# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# https://kafka.apache.org/documentation.html 

NEO4J_VERSION=4.4.19
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
	- wget --no-clobber ${URL} -O var/downloads/neo4j-community-${NEO4J_VERSION}-unix.tar.gz
	- cd var/downloads/ && tar -xzf neo4j-community-${NEO4J_VERSION}-unix.tar.gz


.PHONY: make-instance
make-instance:
	- mv var/downloads/neo4j-community-${NEO4J_VERSION} var/instances/${NEO4J_VERSION}


.PHONY: make-symlinks
make-symlinks:
	- cd var/instances && ln -fs ${NEO4J_VERSION} current
	- ln -fs var/instances/current/bin bin
	- ln -fs var/instances/current/conf etc
	- cd var && ln -fs instances/current/logs log

	# @echo -e "Create symlinks in ${HOME}/bin/"
	# - cd ~/bin  && ln -fs $(realpath var/instances/${NEO4J_VERSION}/bin/neo4j)
	# - cd ~/bin  && ln -fs $(realpath var/instances/${NEO4J_VERSION}/bin/neo4j-admin)
