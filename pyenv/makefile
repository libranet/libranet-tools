# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# If .ONESHELL is mentioned as a target, then when a target is built
# all lines of the recipe will be given to a single invocation of the
# shell rather than each line being invoked separately.
.ONESHELL:

# See https://stackoverflow.com/questions/19456518/error-when-using-sed-with-find-command-on-os-x-invalid-command-code
# By default MacOS does not use GNU Sed, but a different less-compatible sed-implemenation that
# easily triggers following error: 'invalid command code'.
# You need to install GNU Sed via 'brew install gnu-sed' to make the 'gsed'-command available on $PATH.
# In our makesfiles, use gsed if found, otherwise regular sed.
SED=`command -v gsed || command -v sed`

export PYENV_ROOT=var/repo
TMPDIR=var/tmp

# # PYENV_ROOT="$HOME/.pyenv
# export PYENV_ROOT='.'
CMD=$(realpath ${PYENV_ROOT}/libexec/pyenv)


.PHONY: clean
clean:
	- rm -fr var


.PHONY: install
install: install-rpm-packages create-dirs install-pyenv update-pyenv install-plugins install-local-symlinks install-symlinks bashrc-install-from-example bashrc-set-dir


.PHONY: install-rpm-packages
install-rpm-packages:
	# - for i in $(cat etc/rpm.txt);do sudo dnf install $i -y; done
	# - for i in $$(grep -vE '^\s*(#|$)' etc/rpm.txt); do sudo dnf install "$$i" -y; done
	# - ../bin/install-rpm.sh etc/rpm.txt


.PHONY: install-pyenv
install-pyenv:
	# curl https://pyenv.run | bash
	curl -s -S -L -f https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash


.PHONY: update-pyenv
update-pyenv:
	${CMD} update


.PHONY: update
update: update-pyenv


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p etc
	@ mkdir -p var
	@ mkdir -p var/tmp


.PHONY: install-symlinks
install-symlinks:
	mkdir -p ${HOME}/bin
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}


.PHONY: install-local-symlinks
install-local-symlinks: create-dirs
	@ echo -e "Symlink ${CMD} to bin/"
	@ cd bin && ln -sf ${CMD}


.PHONY: install-plugins
install-plugins:
	# see https://github.com/pyenv/pyenv-ccache
	- git clone https://github.com/pyenv/pyenv-ccache.git $(PYENV_ROOT)/plugins/pyenv-ccache
	# see https://github.com/pyenv/pyenv-users
	- git clone https://github.com/pyenv/pyenv-users.git "$(PYENV_ROOT)/plugins/pyenv-users"


.PHONY: bashrc-install-from-example  ## instantiate the bashrc-file (no override)
# cp --backup  creates .env~, but will overwrite this next time.
# safest way, is to not overwrite existing .bashrc-files, manual intervention needed.
bashrc-install-from-example:
	@ echo -e "Copying etc/bashrc.example to etc/bashrc" ;\
	cp -n  etc/bashrc.example  etc/bashrc ;\
	echo "Please review the etc/bashrc-file."


.PHONY: bashrc-set-dir ## replace placeholder __PYENV_ROOT__ with current working directory
bashrc-set-dir: bashrc-install-from-example
	@echo -e "Replacing string __PYENV_ROOT__ -> $(PYENV_ROOT ${PYENV_ROOT})" ;\
	$(SED) -i 's@__PYENV_ROOT__@'"$(realpath ${PYENV_ROOT})"'@'  etc/bashrc



.PHONY: pyenv-available-versions ## list available python-versions
pyenv-available-versions:
	bin/pyenv install --list


.PHONY: pyenv-installed-versions ## list installed python-versions
pyenv-installed-versions:
	bin/pyenv versions


.PHONY: pyenv-install-python-3-10-10 ## install python 3.10.10
pyenv-install-python-3-10-7:
	bin/pyenv install -v 3.10.10


.PHONY: pyenv-install-python-3-11-5 ## install python 3.11.5
pyenv-install-python-3-11-5:
	bin/pyenv install -v 3.11.5


.PHONY: pyenv-install-python-3-11-6 ## install python 3.11.6
pyenv-install-python-3-11-6:
	bin/pyenv install -v 3.11.6


.PHONY: pyenv-install-python-latest-38 ## install python 3.8.x
pyenv-install-python-latest-38:
	PYTHON_VERSION=$(bin/pyenv install --list | egrep '^[[:space:]]*3\.8' | tail -n 1)
	bin/pyenv install -v ${PYTHON_VERSION}


.PHONY: pyenv-install-python-latest-39 ## install python 3.9.x
pyenv-install-python-latest-39:
#	- PYTHON_VERSION=$(pyenv install --list | egrep '^[[:space:]]*3\.9' | tail -n 1) && bin/pyenv install -v ${PYTHON_VERSION}
	- bin/pyenv install -v $(pyenv install --list | egrep '^[[:space:]]*3\.9' | tail -n 1)


.PHONY: pyenv-install-python-latest-310 ## install python 3.10.x
pyenv-install-python-latest-310: ## Install the latest Python 3.10.x
	PYTHON_VERSION=$$(bin/pyenv install --list | grep -E '^[[:space:]]*3\.10' | tail -n 1); \
	bin/pyenv install -v $${PYTHON_VERSION}

#pyenv-install-python-latest-310:
#	PYTHON_VERSION=$(bin/pyenv install --list | egrep '^[[:space:]]*3\.10' | tail -n 1)
#	bin/pyenv install -v ${PYTHON_VERSION}


.PHONY: pyenv-install-python-latest-311 ## install python 3.11.x
pyenv-install-python-latest-311:
	PYTHON_VERSION=$(bin/pyenv install --list | egrep '^[[:space:]]*3\.11' | tail -n 1) && bin/pyenv install -v ${PYTHON_VERSION}
