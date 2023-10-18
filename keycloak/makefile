# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=22.0.4
DOWNLOAD_URL=https://github.com/keycloak/keycloak/releases/download/${VERSION}/keycloak-${VERSION}.zip


.PHONY: clean
clean:
	- rm -fr bin
	- rm -fr var


.PHONY: install
install: install-rpms create-dirs download-keycloak unzip-keycloak install-symlinks


.PHONY: install-rpms
install-rpms:
	- sudo dnf -y install java-17-openjdk java-17-openjdk-devel
	- sudo alternatives --config java


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/downloads
	@ mkdir -p var/tmp


.PHONY: download-keycloak
download: create-dirs
	@ echo -e "Downloading ${DOWNLOAD_URL} to var/downloads"
	curl -SLf ${DOWNLOAD_URL} --output var/downloads/keycloak-${VERSION}.zip


.PHONY: unzip-keycloak
unzip-keycloak: 
	@ unzip var/downloads/keycloak-${VERSION}.zip -d var


.PHONY: install-symlinks
install-symlinks:
	@ cd var && ln -sf keycloak-${VERSION} current  && cd -
	@ cd etc && ln -sf ../var/keycloak-${VERSION}/conf/keycloak.conf .  && cd -
	@ ln -sf var/keycloak-${VERSION}/bin bin  && cd -


.PHONY: start 
start:
	bin/kc.sh start-dev


.PHONY: open-browser 
open-browser :
	xdg-open "http://localhost:8080/"