# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# PYTHON_VERSION=`~/bin/pyenv versions --bare |grep '3.11' | tail -n 1`


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
	bin/pip install --upgrade isort


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath bin/isort) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/isort)


.PHONY: version
version:
	@ echo -e "\nCurrent version is:"
	@ bin/isort --version
