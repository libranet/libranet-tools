# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.
MAKEFLAGS += --always-make --warn-undefined-variables
.NOTPARALLEL:
.ONESHELL:

SED=`command -v gsed || command -v sed`

help:  #? display this help information
	@ grep "^#?" makefile | cut -c 4-
	@ echo -e "\nThis help is generated by parsing the inline comments."
	@ echo -e "Please use \`make <target>' where <target> is one of:\n"
	@ grep -E '^[a-zA-Z_-]+:.*?#?.*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?#\\? "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# see https://github.com/pdm-project/awesome-pdm

CMD=$(realpath bin/flit)

clean:
	@ rm -fr bin include lib lib64 pyvenv.cfg
	@ rm -fr var

install: create-dirs create-venv upgrade-pip install-packages install-symlinks version

update: upgrade-pip install-packages version

create-dirs:
	@ mkdir -p var/cache

create-venv:
	python3 -m venv .

upgrade-pip:
	bin/python -m pip install --upgrade pip

install-packages:
	bin/pip install --upgrade flit

install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}

version:
	@ echo -e "\nCurrent version is:"
	@ bin/flit --version
