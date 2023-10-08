# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/hadolint)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=v2.12.0
#DOWNLOAD_URL=https://github.com/hadolint/hadolint/releases/download/${VERSION}/hadolint-Linux-x86_64
DOWNLOAD_URL=https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64

.PHONY: clean
clean:
	- rm -fr bin
	- rm -fr var


.PHONY: install
install: create-dirs download install-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/tmp


.PHONY: download
download:
	@ echo -e "Download ${DOWNLOAD_URL} to bin/hadolint"
	curl -sSLf ${DOWNLOAD_URL} --output bin/hadolint
	@ chmod u+x bin/hadolint


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD} hadolint
