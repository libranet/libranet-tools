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


CMD=$(realpath bin/terraform)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=1.6.5
DOWNLOAD_URL=https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_arm64.zip

clean:
	@ rm -fr bin
	@ rm -fr var

create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/cache
	@ mkdir -p var/cache/terraform-plugin-cache
	@ mkdir -p var/tmp

install: create-dirs download install-symlinks

download:
	curl -fLS "${DOWNLOAD_URL}" -o "var/tmp/terraform_${VERSION}_linux_arm64.zip"
	unzip var/tmp/terraform_${VERSION}_linux_arm64.zip -d bin
	@ chmod u+x bin/terraform

install-symlinks:
	@ cd ~/bin && ln -sf ${CMD} terraform
