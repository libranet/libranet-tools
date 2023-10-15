# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

VERSION=4.8.0.2856
URL="https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${VERSION}.zip"
TARGET=sonar-scanner-${VERSION}

.PHONY: install
install: create-dirs download unzip install-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var
	@ mkdir -p var/downloads
	@ mkdir -p var/home


.PHONY: download
download:
	# curl ${URL} --silent --show-error --location --fail --output "var/downloads/${VERSION}.zip"
	curl ${URL} -sSLf --output "var/downloads/${VERSION}.zip"


.PHONY: unzip
unzip:
	unzip "var/downloads/${VERSION}.zip" -d var/home


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink current/ to ${VERSION}"
	@ cd var/home && ln -sf sonar-scanner-${VERSION} current && cd -
	@ cd bin && ln -sf $(realpath ../var/home/current/bin/sonar-scanner --no-symlinks) && cd -
	@ cd bin && ln -sf $(realpath ../var/home/current/bin/sonar-scanner-debug) && cd -

#	@ ln -sf current/conf etc
#"	@ echo -e "Symlink $(realpath bin/sonar-scanner --no-symlinks) to ${HOME}/bin/"
#	@ cd ~/bin && ln -sf $(realpath bin/sonar-scanner --no-symlinks)
#	@ echo -e "Symlink $(realpath bin/sonar-scanner-debug --no-symlinks) to ${HOME}/bin/"
#	@ cd ~/bin && ln -sf $(realpath bin/sonar-scanner-debug --no-symlinks)


