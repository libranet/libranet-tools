# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

.PHONY: clean
clean:
	@ rm -fr etc
	@ rm -fr var


.PHONY: create-dirs
create-dirs:
	@ mkdir -p etc
	@ mkdir -p var
	@ mkdir -p var/cache
	@ mkdir -p var/home
	@ mkdir -p var/log


.PHONY: install
install: create-dirs clone-repo install-symlinks


.PHONY: update
update: create-dirs update-repo install-symlinks


.PHONY: clone-repo
clone-repo:
	git clone https://github.com/zsh-users/antigen.git var/repo || git pull


.PHONY: update-repo
update-repo:
	@ cd var/repo && git pull


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath var/repo/antigen.zsh) to etc/antigen.zsh"
	@ cd etc && ln -sf $(realpath var/repo/antigen.zsh)
