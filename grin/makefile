# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

PYTHON_VERSION=`~/bin/pyenv versions --bare |grep '3.10'`


.PHONY: install
install:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .
	- bin/python -m pip install --upgrade pip
	- bin/pip install grin3
	@echo -e "Create symlink in $HOME/bin/grin"
	- cd ~/bin  && ln -s $(realpath bin/grin) grin
