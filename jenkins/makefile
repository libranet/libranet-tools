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

CMD=$(realpath bin/jenkins)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=2.414.2
FILENAME=jenkins.war
DOWNLOAD_URL=https://get.jenkins.io/war-stable/${VERSION}/${FILENAME}


clean:  #? remove generated files & dirs
	@ rm -fr bin
	@ rm -fr var

install: create-dirs download-jenkins install-symlinks #? run all install-steps

create-dirs:  #? create dirs
	@ mkdir -p bin
	@ mkdir -p var/home
	@ mkdir -p var/releases
	@ mkdir -p var/tmp

download-jenkins:  #? download jenkins-warfile
	@ echo -e "\nDownloading jenkins:\n"
	@ mkdir -p var/releases/${VERSION}
	curl -SLf ${DOWNLOAD_URL} --output var/releases/${VERSION}/${FILENAME}
	@ chmod u+x var/releases/${VERSION}/${FILENAME}

install-symlinks:  #?install symlinks
	@ ln -s var/releases/${VERSION}/${FILENAME} jenkins.war

start:
	java -jar var/jenkins.war

jenkins-help:
	java -jar jenkins.war --help

open-browser:
	xdg-open "http://localhost:8080"
