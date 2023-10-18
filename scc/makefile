# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/scc)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=3.1.0
FILENAME=scc_${VERSION}_Linux_x86_64.tar.gz
DOWNLOAD_URL=https://github.com/boyter/scc/releases/download/v${VERSION}/${FILENAME}


.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs download install-symlinks check


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/downloads
	@ mkdir -p var/tmp


.PHONY: download
download:
	@ echo -e "Downloading ${DOWNLOAD_URL}"
	curl -SLf ${DOWNLOAD_URL} --output var/downloads/${FILENAME}
	@ tar -xzvf var/downloads/${FILENAME} --directory bin/
	@ chmod u+x bin/scc


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD} scc


.PHONY: check
check:
	@ echo -e "\nCurrent version is:"
	@ bin/scc --version
