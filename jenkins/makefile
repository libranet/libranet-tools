# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# Set default goal to not be dependent on sorting / ordering.
.DEFAULT_GOAL := help


CMD=$(realpath bin/jenkins)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=2.414.2
FILENAME=jenkins.war
DOWNLOAD_URL=https://get.jenkins.io/war-stable/${VERSION}/${FILENAME}


.PHONY: help
help:
	@ echo -e "\nThis help is autogenerated by taking the inline-comments (starting with double ##) from the .PHONY-lines"
	@ echo -e "Please use \`make <target>' whmkere <target> is one of:\n"
	@ grep -E '^\.PHONY: [a-zA-Z_-]+ .*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = "(: |##)"}; {printf "\033[36m%-30s\033[0m %s\n", $$2, $$3}'

.PHONY: clean ## remove generated files & dirs
clean:
	- rm -fr bin
	- rm -fr var


.PHONY: install ## run all install-steps
install: create-dirs download-jenkins install-symlinks


.PHONY: create-dirs  ## create dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/releases
	@ mkdir -p var/tmp


.PHONY: download-jenkins  ## download jenkins-warfile
download-jenkins:
	@ echo -e "\nDownloading jenkins:\n"
	@ mkdir -p var/releases/${VERSION}
	curl -SLf ${DOWNLOAD_URL} --output var/releases/${VERSION}/${FILENAME}
	@ chmod u+x var/releases/${VERSION}/${FILENAME}


.PHONY: install-symlinks  ##install symlinks
install-symlinks:
	@ ln -s var/releases/${VERSION}/${FILENAME} jenkins.war


.PHONY: start
start:
	java -jar var/jenkins.war


.PHONY: jenkins-help
jenkins-help:
	java -jar jenkins.war --help


.PHONY: open-browser
open-browser:
	xdg-open "http://localhost:8080"