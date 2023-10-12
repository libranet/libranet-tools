# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# https://neo4j.com/download-center/

NEO4J_VERSION=4.4.19
URL="https://neo4j.com/artifact.php?name=neo4j-community-${NEO4J_VERSION}-unix.tar.gz"


.PHONY: install
install: create-dirs download-neo4j download-apoc make-instance install-apoc make-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p var
	@ mkdir -p var/downloads
	@ mkdir -p var/instances
	@ mkdir -p var/tmp

.PHONY: download-neo4j
download-neo4j:
	- wget --no-clobber ${URL} -O var/downloads/neo4j-community-${NEO4J_VERSION}-unix.tar.gz
	- cd var/downloads/ && tar -xzf neo4j-community-${NEO4J_VERSION}-unix.tar.gz


.PHONY: install-rpms
install-rpms:
	- sudo dnf install tcltls


.PHONY: build-redis
build-redis:
	- make BUILD_TLS=yes


.PHONY: test-redis
test-redis:
	- make test


.PHONY: generate-test-certicate
generate-test-certicate:
	- ./utils/gen-test-certs.sh


.PHONY: runtest-redis
runtest-redis:
	- ./runtest --tls    # requires tls


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
