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

CMD=$(realpath bin/oh-my-posh)

# Define the variable to hold the current directory
BASE_DIR := $(CURDIR)

install: create-dirs install-executable install-themes install-symlinks download-fonts

update: install-executable

create-dirs:
	@ mkdir -p bin
	@ mkdir -p etc
	@ mkdir -p var
	@ mkdir -p var/tmp
	@ mkdir -p ~/.cache/oh-my-posh  # avoid files like ~/omp.cache because cache-dir did not exist.

 install-executable: create-dirs
	# install executable
	wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O bin/oh-my-posh
	chmod u+x bin/oh-my-posh

install-themes:
	# install themes
	mkdir -p var/themes
	wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O  var/tmp/themes.zip
	unzip var/tmp/themes.zip -d var/themes
	chmod u+rw var/themes/*.omp.*

install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}

enable-bashrc:
	@ echo -e '\n\nsource ${BASE_DIR}/etc/bashrc' >> ~/.bashrc

enable-zshrc:
	@ echo -e '\n\nsource ${BASE_DIR}/etc/zshrc' >> ~/.zshrc

download-fonts:
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip -P var/tmp
