# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# see https://github.com/pdm-project/awesome-pdm

CMD=$(realpath bin/pdm)


.PHONY: clean
clean:
	@ rm -fr bin include lib lib64 pyvenv.cfg
	@ rm -fr var


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages poetry-update


.PHONY: create-dirs
create-dirs:
	@ mkdir -p var/cache
	@ mkdir -p var/tmp


.PHONY: create-venv
create-venv:
	- python3 -m venv .


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade pdm


.PHONY: poetry-update
poetry-update:
	- bin/pdm self update


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}


.PHONY: check
check:
	@ echo -e "\nCurrent version is:"
	@ bin/pdm --version
