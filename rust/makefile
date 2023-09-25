# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

export CARGO_HOME=$(realpath .)
export RUSTUP_HOME=${CARGO_HOME}/rustup


.PHONY: install
install: install-rust create-dirs


.PHONY: update
update: update-rust create-dirs


.PHONY: install-rust
install-rust:
	- curl https://sh.rustup.rs -sSf | sh


.PHONY: update-rust
update-rust:
	- echo -e "Updating rust itself."
	- bin/rustup update


.PHONY: create-dirs
create-dirs:
	- mkdir -p etc
	- mkdir -p var
	- mkdir -p var/tmp

# .PHONY: install-symlinks
# install-symlinks:
# 	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
# 	@ cd ~/bin && ln -sf ${CMD}
