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

clean:
	@ rm -fr bin

install: create-dirs download install-symlinks version

update: install

create-dirs:
	@ mkdir -p bin

download:
	curl -sSLf --proto '=https' --tlsv1.2 https://github.com/devemio/docker-color-output/releases/download/2.5.1/docker-color-output-linux-amd64 --output bin/docker-color-output
	@ chmod u+x bin/docker-color-output


install-symlinks:
	@ echo -e "Symlink $(realpath bin/docker-color-output) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/docker-color-output)

version:
	@ echo -e "\nCurrent version is:"
	@ bin/docker-color-output --help
