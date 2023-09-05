# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/glances)
PYTHON_VERSION=`~/bin/pyenv versions --bare |grep '3.11' | tail -n 1`


.PHONY: install
install: create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-venv
create-venv:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: create-dirs
create-dirs:
	- mkdir -p var


.PHONY: install-packages
install-packages:
	# https://github.com/nicolargo/glances
# - bin/pip install --upgrade glances
	- bin/pip install  --upgrade 'glances[action,browser,cloud,cpuinfo,docker,export,folders,gpu,graph,ip,raid,snmp,web,wifi]'
	- bin/pip install  --upgrade sparklines
	- bin/pip install  --upgrade pySMART


.PHONY: install-symlinks
install-symlinks:  create-dirs
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}
	@ cd var && ln -sf ~/.cache/glances log
