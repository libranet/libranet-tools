# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/hadolint)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=10.0.0
FILENAME=grafana-enterprise-${VERSION}.linux-amd64.tar.gz
DOWNLOAD_URL=https://dl.grafana.com/enterprise/release/${FILENAME}


.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs download install-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/cache
	@ mkdir -p var/downloads
	@ mkdir -p var/log
	@ mkdir -p var/run
	@ mkdir -p var/tmp


.PHONY: download
download:
	@ echo -e "Downloading ${DOWNLOAD_URL}"
	@ curl -SLf ${DOWNLOAD_URL} --output var/downloads/${FILENAME}
	@ tar xzf var/downloads/${FILENAME} --directory var


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD} hadolint
