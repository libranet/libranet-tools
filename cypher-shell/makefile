# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

VERSION=4.2.2

URL="https://github.com/neo4j/cypher-shell/releases/download/${VERSION}/cypher-shell.zip"
URL="https://github.com/neo4j/cypher-shell/releases/download/4.2.2/cypher-shell.zip"


.PHONY: install
install: create-dirs download unzip install-symlinks



.PHONY: create-dirs
create-dirs:
	- mkdir -p bin
	- mkdir -p etc
	- mkdir -p var
	- mkdir -p var/downloads
	- mkdir -p var/instances


.PHONY: download
download:
	curl -fsLS ${URL} --output "var/downloads/${VERSION}.zip"


.PHONY: unzip
unzip:
	unzip "var/downloads/${VERSION}.zip" -d var/instances


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink current/ to ${VERSION}"
	# @ ln -sf sonar-scanner-${VERSION} current
	# @ ln -sf var/current/bin bin
	# # @ echo -e "Symlink $(realpath bin/sonar-scanner --no-symlinks) to ${HOME}/bin/"
	# # @ cd ~/bin && ln -sf $(realpath bin/sonar-scanner --no-symlinks)
	# # @ echo -e "Symlink $(realpath bin/sonar-scanner-debug --no-symlinks) to ${HOME}/bin/"
	# # @ cd ~/bin && ln -sf $(realpath bin/sonar-scanner-debug --no-symlinks)


