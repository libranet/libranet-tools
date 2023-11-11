# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/hadolint)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=2.7.1
FILENAME=influxdb2-${VERSION}-linux-amd64.tar.gz
DOWNLOAD_URL=https://dl.influxdata.com/influxdb/releases/influxdb2-2.7.1-linux-amd64.tar.gz


clean:
	@ rm -fr bin
	@ rm -fr var

create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/downloads
	@ mkdir -p var/tmp

install: create-dirs download install-symlinks

download:
	@ echo -e "Downloading ${DOWNLOAD_URL}"
	curl -SLf ${DOWNLOAD_URL} --output var/downloads/${FILENAME}
	@ tar xzf var/downloads/${FILENAME} --directory bin --strip-components 1

install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
#	@ cd ~/bin && ln -sf ${CMD} hadolint

version:
	bin/influxd version

run:
	bin/influxd run

influxdb-help:
	bin/influxd help

inspect:
	bin/influxd inspect

