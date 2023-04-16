# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# PYTHON_VERSION=`~/bin/pyenv versions --bare |grep '3.11'`
PYTHON_VERSION='3.11.2'


.PHONY: install
install: create-venv upgrade-pip install-packages install-symlinks


.PHONY: create-venv
create-venv:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .


.PHONY: upgrade-pip
upgrade-pip:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .


.PHONY: install-packages
install-packages:
	- bin/pip install zest.releaser


.PHONY: install-symlinks
install-symlinks:
	@echo -e "Create symlinks in ~/bin/"
	- ln -fs $(realpath bin/release) ~/bin/
	- ln -fs $(realpath bin/fullrelease) ~/bin/
	- ln -fs $(realpath bin/prerelease) ~/bin/


.PHONY: download
download:
	- wget https://download.arangodb.com/arangodb310/Community/Linux/arangodb3-client-linux-3.10.4_x86_64.tar.gz
	- wget  https://download.arangodb.com/arangodb310/Community/Linux/arangodb3-linux-3.10.4_x86_64.tar.gz