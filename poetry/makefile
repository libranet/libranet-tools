# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

PYTHON_VERSION=`~/bin/pyenv versions --bare |grep '3.11' | tail -n 1`
CMD=$(realpath bin/poetry)


.PHONY: clean
clean:
	rm -fr bin include lib lib64 pyvenv.cfg


.PHONY: install
install: create-venv create-dirs upgrade-pip install-packages install-extensions install-symlinks


.PHONY: update
update: upgrade-pip install-packages poetry-update


.PHONY: create-venv
create-venv:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .


.PHONY: create-dirs
create-dirs:
	- mkdir -p var/cache
	- mkdir -p var/log
	- mkdir -p var/tmp

.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade poetry


.PHONY: poetry-update
poetry-update:
	- bin/poetry self update


.PHONY: install-extensions
install-extensions:

    # see https://pypi.org/project/poetry-dynamic-versioning/
	@ echo -e "Installing poetry-plugin: poetry-dynamic-versioning."
	- bin/poetry self add "poetry-dynamic-versioning[plugin]"

    # see https://github.com/python-poetry/poetry-plugin-export
	@ echo -e "Installing poetry-plugin: poetry-plugin-export."
	- bin/poetry self add poetry-plugin-export

    # https://github.com/madkinsz/poetry-relax
	@ echo -e "Installing poetry-plugin: poetry-relax."
	- bin/poetry self add poetry-relax

    # see https://github.com/tiangolo/poetry-version-plugin
	@ echo -e "Installing poetry-plugin: poetry-version-plugin."
	- bin/poetry self add poetry-version-plugin


# see https://github.com/topenkoff/poetry-release
# broken https://github.com/topenkoff/poetry-release/issues/6
# @ echo -e "Installing poetry-plugin: poetry-release."
# - bin/poetry self add poetry-release

.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}
	@ && ln -sf ~/.config/pypoetry etc
