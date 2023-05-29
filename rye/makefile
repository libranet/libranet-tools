# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# https://rye-up.com/guide/installation/
RYE_HOME=$(realpath .)
RYE_VERSION='latest'
RYE_INSTALL_OPTION='--yes'

.PHONY: install
install: 
	curl -sSf https://rye-up.com/get | bash


.PHONY: update
update:
	rye self update


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${RYE_HOME}/shims/rye to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${RYE_HOME}/shims/rye
