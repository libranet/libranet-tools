# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# See https://stackoverflow.com/questions/19456518/error-when-using-sed-with-find-command-on-os-x-invalid-command-code
# By default MacOS does not use GNU Sed, but a different less-compatible sed-implemenation that
# easily triggers following error: 'invalid command code'.
# You need to install GNU Sed via 'brew install gnu-sed' to make the 'gsed'-command available on $PATH.
# In our makesfiles, use gsed if found, otherwise regular sed.
SED=`command -v gsed || command -v sed`

CMD=$(realpath bin/semgrep)
PYTHON_VERSION=`pyenv versions --bare |grep '3.11' | tail -n 1`


.PHONY: clean
clean:
	- rm -fr bin include lib lib64 pyvenv.cfg
	- rm -fr var


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-venv
create-venv:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .


.PHONY: create-dirs
create-dirs:
	- mkdir -p etc
	- mkdir -p var/cache
	- mkdir -p var/log


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade semgrep autoread-dotenv


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}
	@ cd ~/bin && ln -sf $(realpath bin/pysemgrep)


.PHONY: dotenv-install-from-template ## instantiate the dotenv-file (no override)
# cp --backup  creates .env~, but will overwrite this next time.
# safest way, is to not overwrite existing .env-files, manual intervention needed.
dotenv-install-from-template:
	@echo -e "Copying .env.template to .env" ;\
	cp -n .env.template .env ;\
	echo "Please review any credentials in the .env-file."


.PHONY: dotenv-set-basedir ## replace placeholder __CDW__ with current working directory
dotenv-set-basedir:
	@echo -e "Replacing string __CWD__ -> $(PWD)" ;\
	$(SED) -i 's@__CWD__@'"$(PWD)"'@'  .env


.PHONY: dotenv-install ## install .env-file from .env.template
dotenv-install: dotenv-install-from-template dotenv-set-basedir
