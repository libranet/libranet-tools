# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# https://httpie.io/docs/cli/examples

PYTHON_VERSION=`~/bin/pyenv versions --bare |grep '3.11' | tail -n 1`


.PHONY: clean
clean:
	- rm -fr bin include lib lib64 pyvenv.cfg share
	- rm -fr var


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip upgrade-wheel install-packages


.PHONY: create-dirs
create-dirs:
	@ mkdir -p var/cache


.PHONY: create-venv
create-venv:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .


.PHONY: upgrade-pip
upgrade-pip:
	- bin/python -m pip install --upgrade pip


.PHONY: upgrade-wheel
upgrade-wheel:
	- bin/python -m pip install --upgrade wheel


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade httpie


.PHONY: install-symlinks
install-symlinks:
	# @ echo -e "Symlink $(realpath bin/http) to ${HOME}/bin/"
	- cd ~/bin && ln -sf $(realpath bin/httpie)
	- cd ~/bin && ln -sf $(realpath bin/http)
	- cd ~/bin && ln -sf $(realpath bin/https)


.PHONY: check
check:
	@ echo -e "\nCurrent version is:"
	- bin/httpie --version