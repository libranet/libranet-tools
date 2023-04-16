# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CARGO_HOME=$(realpath .)
RUSTUP_HOME=${CARGO_HOME}/rustup


CMD=$(realpath bin/cookiecutter)
CMD_CRUFT=$(realpath bin/cruft)


.PHONY: install
install: install-rust create-dirs
# install-symlinks


.PHONY: install-rust
install-rust:
	- curl https://sh.rustup.rs -sSf | sh


.PHONY: create-dirs
create-dirs:
	- mkdir -p etc
	- mkdir -p var


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}

	@ echo -e "Symlink ${CMD_CRUFT} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD_CRUFT}
