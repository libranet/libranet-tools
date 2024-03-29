# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.
MAKEFLAGS += --always-make --warn-undefined-variables
.DEFAULT_GOAL := help # set default goal to not be dependent on sorting / ordering.
.NOTPARALLEL:
.ONESHELL:  # all lines of the recipe will be given to a single invocation of the shell

help:  #? display this help information
	@ grep "^#?" makefile | cut -c 4-
	@ echo -e "\nThis help is generated by parsing the inline comments."
	@ echo -e "Please use \`make <target>' where <target> is one of:\n"
	@ grep -E '^[a-zA-Z_-]+:.*?#?.*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?#\\? "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=22.0.4
DOWNLOAD_URL=https://github.com/keycloak/keycloak/releases/download/${VERSION}/keycloak-${VERSION}.zip

clean:
	@ rm -fr bin
	@ rm -fr var

create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/downloads
	@ mkdir -p var/tmp
install: install-rpms create-dirs download-keycloak unzip-keycloak install-symlinks

install-rpms:
	sudo dnf -y install java-17-openjdk java-17-openjdk-devel
	sudo alternatives --config java

download: create-dirs
	@ echo -e "Downloading ${DOWNLOAD_URL} to var/downloads"
	curl -SLf ${DOWNLOAD_URL} --output var/downloads/keycloak-${VERSION}.zip

unzip-keycloak:
	@ unzip var/downloads/keycloak-${VERSION}.zip -d var

install-symlinks:
	@ cd var && ln -sf keycloak-${VERSION} current  && cd -
	@ cd etc && ln -sf ../var/keycloak-${VERSION}/conf/keycloak.conf .  && cd -
	@ ln -sf var/keycloak-${VERSION}/bin bin  && cd -

start:
	bin/kc.sh start-dev

open-browser :
	xdg-open "http://localhost:8080/"
