# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/hadolint)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=2.7.1
FILENAME=influxdb2-${VERSION}-linux-amd64.tar.gz
DOWNLOAD_URL=https://dl.influxdata.com/influxdb/releases/influxdb2-2.7.1-linux-amd64.tar.gz


.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs download install-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/downloads
	@ mkdir -p var/tmp


.PHONY: download
download:
	@ echo -e "Downloading ${DOWNLOAD_URL}"
	curl -SLf ${DOWNLOAD_URL} --output var/downloads/${FILENAME}
	@ tar xzf var/downloads/${FILENAME} --directory bin --strip-components 1


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
#	@ cd ~/bin && ln -sf ${CMD} hadolint


.PHONY: version
version:
	bin/influxd version


.PHONY: run
run:
	bin/influxd run


.PHONY: help
help:
	bin/influxd help


.PHONY: inspect
inspect:
	bin/influxd inspect

