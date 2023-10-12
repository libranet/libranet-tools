# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/gitlab-runner)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=v2.12.0
DOWNLOAD_URL=https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64

# https://gitlab-runner-downloads.s3.amazonaws.com/latest/index.html
#sudo curl -L --output /usr/local/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"

.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs download install-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p etc
	@ mkdir -p var/tmp


.PHONY: download
download:
	@ echo -e "Downloading ${DOWNLOAD_URL}:\n"
	curl -SLf ${DOWNLOAD_URL} --output bin/gitlab-runner
	@ chmod u+x bin/gitlab-runner


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD} gitlab-runner


.PHONY: check
check:
	@ echo -e "current version is:"
	- bin/gitlab-runner --version


.PHONY: start
start:
	-bin/gitlab-runner run --config etc/config.toml
