# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.
#
# see https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=script

PYTHON_VERSION=`~/bin/pyenv versions --bare |grep '3.11' | tail -n 1`
# PYTHON_VERSION=3.11.2


.PHONY: clean
clean:
	- rm -fr bin include lib lib64 pyvenv.cfg
	- rm -fr var


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-dirs
create-dirs:
	- mkdir -p etc
	- mkdir -p var
	- mkdir -p var/cache
	- mkdir -p var/log
	- mkdir -p var/tmp


.PHONY: create-venv
create-venv:
	# - PYENV_VERSION=${PYTHON_VERSION} python -m venv .
	- python3 -m venv .


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade azure-cli autoread-dotenv


# .PHONY: install-configfile
# install-configfile:
# 	@echo -e "Copying etc/cookiecutterrc.template to etc/cookiecutterrc" ;\
# 	cp -n etc/cookiecutterrc.template etc/cookiecutterrc ;\
# 	echo "Please review the config in etc/cookiecutterrc."
# 	@echo -e "Replacing string __BASE_DIR__ -> $(PWD)" ;\
# 	$(SED) -i 's@__BASE_DIR__@'"$(PWD)"'@'   etc/cookiecutterrc


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath bin/az) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/az)


