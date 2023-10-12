# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# https://redis.com/redis-enterprise/redis-insight/#insight-form

.PHONY: install
install: create-dirs download-neo4j download-apoc make-instance install-apoc make-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var
	@ mkdir -p var/downloads
	@ mkdir -p var/instances
	@ mkdir -p var/tmp


.PHONY: install-rpms
install-rpms:
	- sudo dnf install fuse-devel


.PHONY: build-redis
build-redis:
	- cmod u+x *.AppImage



.PHONY: make-symlinks
make-symlinks:
	- cd var/instances && ln -fs ${NEO4J_VERSION} current
	- ln -fs var/instances/current/bin bin
	- ln -fs var/instances/current/conf etc
	- cd var && ln -fs instances/current/logs log

	# @echo -e "Create symlinks in ${HOME}/bin/"
	# - cd ~/bin  && ln -fs $(realpath var/instances/${NEO4J_VERSION}/bin/neo4j)
