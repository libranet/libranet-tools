# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.
MAKEFLAGS += --always-make --warn-undefined-variables
.DEFAULT_GOAL := help # set default goal to not be dependent on sorting / ordering.
.NOTPARALLEL:
.ONESHELL:  # all lines of the recipe will be given to a single invocation of the shell

help:  #? display this help information
	@ grep "^#?" makefile | cut -c 4-
	@ echo -e "\nThis help is generated by parsing the inline comments."
	@ echo -e "Please use \`make <target>' where <target> is one of:\n"
	@ grep -E '^[a-zA-Z_-]+:.*?#?.*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?#\\? "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


CMD=$(realpath bin/hadolint)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

clean:
	@ rm -fr bin
	@ rm -fr var

install: create-dirs download install-rvm install-symlinks

create-dirs:
	@ mkdir -p bin
	@ mkdir -p etc
	@ mkdir -p var/cache
	@ mkdir -p var/home
	@ mkdir -p var/tmp

download:
	#@ echo -e "Downloading ${DOWNLOAD_URL} to bin/hadolint"
	#curl -sSLf ${DOWNLOAD_URL} --output bin/hadolint
	curl -sSLf https://rvm.io/pkuczynski.asc --output etc/pkuczynski.asc
	curl -sSL https://rvm.io/mpapis.asc --output etc/mpapis.asc
	curl -sSL https://get.rvm.io --output bin/rvm-installer.sh
	gpg2 --import etc/pkuczynski.asc
	gpg2 --import etc/mpapis.asc
	@ chmod u+x bin/rvm-installer.sh

install-rvm:
	bin/rvm-installer.sh latest --path $(realpath var/home) --ignore-dotfiles

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
