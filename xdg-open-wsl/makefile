# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# see https://github.com/cpbotha/xdg-open-wsl
CMD=$(realpath bin/xdg-open)
export TMP=$(realpath var/tmp)


.PHONY: clean
clean:
	@ rm -fr bin include lib lib64 pyvenv.cfg


.PHONY: install
install: create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-venv
create-venv:
	- python3 -m venv .


.PHONY: create-dirs
create-dirs:
	@ mkdir -p var/src
	@ mkdir -p var/tmp


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	# - bin/pip install --upgrade xdg-open-wsl  # not on pypi
	- bin/pip install --upgrade git+https://github.com/woutervh/xdg-open-wsl.git@master


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}
