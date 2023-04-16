# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

PYENV_ROOT=repo

CMD=$(realpath ${PYENV_ROOT}/libexec/pyenv)


.PHONY: install
install: install-pyenv update


.PHONY: install-pyenv
install-pyenv:
	curl https://pyenv.run | bash


.PHONY: update
update:
	${CMD} update


.PHONY: create-dirs
create-dirs:
	- mkdir -p etc
	- mkdir -p bin


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}


.PHONY: install-local-symlinks
install-local-symlinks: create-dirs
	@ echo -e "Symlink ${CMD} to bin/"
	@ cd bin && ln -sf ${CMD}