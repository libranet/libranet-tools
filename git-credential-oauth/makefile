# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/hadolint)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=v0.11.0
FILENAME=git-credential-oauth_${VERSION}_linux_amd64.tar.gz
DOWNLOAD_URL=https://github.com/hickford/git-credential-oauth/releases/download/${VERSION}/${FILENAME}

.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs download install-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/tmp


.PHONY: download
download:
	@ echo -e "Downloading ${DOWNLOAD_URL}:"
	curl -sSLf ${DOWNLOAD_URL} --output var/downloads/${FILNAME}


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD} hadolint
