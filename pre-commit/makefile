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

SED=`command -v gsed || command -v sed`

clean:
	@ rm -fr bin include lib lib64 pyvenv.cfg
	@ rm -fr var

create-dirs:
	@ mkdir -p var/cache
	@ mkdir -p var/home
	@ mkdir -p var/log
	@ mkdir -p var/tmp

install: create-dirs create-venv upgrade-pip install-packages install-dotenv install-symlinks version

update: upgrade-pip install-packages version

create-venv:
	python3 -m venv .

upgrade-pip:
	bin/python -m pip install --upgrade pip

install-packages:
	bin/pip install --upgrade pre-commit pre-commit-hooks
	bin/pip install --upgrade autoread-dotenv

install-dotenv:  #? generate .dotenv from template
	@ echo -e "Copying .env.template to .env"
	@ cp -n .env.template .env
	@ echo "Please review the config in .env"
	@ echo -e "Replacing string __CWD__ -> $(PWD)"
	@ $(SED) -i 's@__CWD__@'"$(PWD)"'@' .env

install-symlinks:
	@ echo -e "Symlink $(realpath bin/pre-commit) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/pre-commit)

version:
	@ echo -e "\nCurrent version is:"
	@ bin/pre-commit --version