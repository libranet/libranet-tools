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
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs download install-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p etc
	@ mkdir -p var/cache
	@ mkdir -p var/home
	@ mkdir -p var/tmp


.PHONY: download
download:
	git clone https://github.com/rbenv/rbenv.git var/home



.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath var/home/bin/rvm) && cd -
	@ cd ~/bin && ln -sf $(realpath var/home/bin/rvm-exec) && cd -
	@ cd ~/bin && ln -sf $(realpath var/home/bin/rvm-prompt) && cd -
	@ cd ~/bin && ln -sf $(realpath var/home/bin/rvm-shell) && cd -
	@ cd ~/bin && ln -sf $(realpath var/home/bin/rvm-smile) && cd -
	@ cd ~/bin && ln -sf $(realpath var/home/bin/rvm-auto-ruby) && cd -
	@ cd ~/bin && ln -sf $(realpath var/home/bin/rvmsudo) && cd -
	@ cd etc && ln -sf $(realpath var/home/config) nvm && cd -
