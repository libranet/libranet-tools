# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# see https://github.com/pdm-project/awesome-pdm

CMD=$(realpath bin/flit)


.PHONY: clean
clean:
	@ rm -fr bin include lib lib64 pyvenv.cfg
	@ rm -fr var


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-symlinks version


.PHONY: update
update: upgrade-pip install-packages version


.PHONY: create-dirs
create-dirs:
	@ mkdir -p var/cache


.PHONY: create-venv
create-venv:
	python3 -m venv .


.PHONY: upgrade-pip
upgrade-pip:
	bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	bin/pip install --upgrade flit


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}


.PHONY: version
version:
	@ echo -e "\nCurrent version is:"
	@ bin/flit --version
