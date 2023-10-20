# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/hadolint)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=2.9.1
FILENAME=chroma-${VERSION}-linux-amd64.tar.gz
DOWNLOAD_URL=https://github.com/alecthomas/chroma/releases/download/v${VERSION}/${FILENAME}

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
	@ echo -e "Downloading ${DOWNLOAD_URL} to var/downloads"
	curl -sSLf ${DOWNLOAD_URL} --output var/dowloads/${FILENAME}
	@ tar xzvf var/dowloads/${FILENAME}
	@ chmod u+x bin/chroma


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/chroma) chroma && cd -
