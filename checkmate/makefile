# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.
MAKEFLAGS += --always-make --warn-undefined-variables
.DEFAULT_GOAL := help # set default goal to not be dependent on sorting / ordering.
.NOTPARALLEL:
.ONESHELL:  # all lines of the recipe will be given to a single invocation of the shell

CMD=$(realpath bin/checkmate)

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

VERSION=0.2.2
FILENAME=checkmake-${VERSION}.linux.amd64
DOWNLOAD_URL=https://github.com/mrtazz/checkmake/releases/download/${VERSION}/${FILENAME}


help:  #? display this help information
	@ grep "^#?" makefile | cut -c 4-
	@ echo -e "\nThis help is generated by parsing the inline comments."
	@ echo -e "Please use \`make <target>' where <target> is one of:\n"
	@ grep -E '^[a-zA-Z_-]+:.*?#?.*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?#\\? "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


clean:  #? remove generated files & dirs
	@ rm -fr bin
	@ rm -fr var

install: create-dirs download install-symlinks version  #? run all install-steps

create-dirs:  #? create files and directories
	@ mkdir -p bin
	@ mkdir -p var/tmp

download:  #? download checkmate
	@ echo -e "Downloading ${DOWNLOAD_URL}"
	@ curl -SLf ${DOWNLOAD_URL} --output bin/checkmate
	@ chmod u+x bin/checkmate

install-symlinks:  #? generate symlinks
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD} checkmate

version:  #? show current version
	@ echo -e "\nCurrent version is:"
	bin/checkmate --version