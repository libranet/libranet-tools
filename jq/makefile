# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/jq)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=1.7
DOWNLOAD_URL=https://github.com/jqlang/jq/releases/download/jq-${VERSION}/jq-linux-amd64

.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs download install-symlinks check


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/tmp


.PHONY: download
download:
	@ echo -e "Downloading ${DOWNLOAD_URL} to bin/jq"
	curl -sSLf ${DOWNLOAD_URL} --output bin/jq
	@ chmod u+x bin/jq


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD} jq


.PHONY: check
check:
	@ echo -e "\nCurrent version is:"
	@ bin/jq --version
