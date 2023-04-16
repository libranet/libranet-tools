# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

VERSION=4.8.0.2856
URL="https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${VERSION}.zip"


.PHONY: install
install: create-dirs download unzip install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-dirs
create-dirs:
	- mkdir -p var
	- mkdir -p var/downloads


.PHONY: download
download:
	curl --silent ${URL} --output "var/downloads/${VERSION}.zip"


.PHONY: unzip
unzip:
	unzip "var/downloads/${VERSION}.zip" -d .


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink current/ to ${VERSION}"
	@ ln -sf sonar-scanner-${VERSION} current
	@ ln -sf current/bin bin
	@ ln -sf current/conf etc
	@ echo -e "Symlink $(realpath bin/sonar-scanner --no-symlinks) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/sonar-scanner --no-symlinks)
	@ echo -e "Symlink $(realpath bin/sonar-scanner-debug --no-symlinks) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/sonar-scanner-debug --no-symlinks)


