# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# https://rye-up.com/guide/installation/
.ONESHELL:

.PHONY: install
install:
	export RYE_HOME=$(realpath .)
	export RYE_VERSION='latest'
	export RYE_INSTALL_OPTION='--yes'
	curl -fsLS https://rye-up.com/get | bash


.PHONY: update
update:
	rye self update


.PHONY: install-symlinks
install-symlinks:
	export RYE_HOME=$(realpath .)
	@ echo -e "Symlink ${RYE_HOME}/shims/rye to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${RYE_HOME}/shims/rye
