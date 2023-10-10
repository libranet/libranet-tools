# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

.PHONY: clean
clean:
	- rm -fr etc
	- rm -fr var


.PHONY: install
install: create-dirs clone-repo install-symlinks


.PHONY: update
update: create-dirs update-repo install-symlinks


.PHONY: create-dirs
create-dirs:
	- mkdir -p etc
	- mkdir -p var


.PHONY: clone-repo
clone-repo:
	- git clone https://github.com/tarjoilija/zgen.git var/repo || git pull


.PHONY: update-repo
update-repo:
	- cd var/repo && git pull


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath var/repo/zgen.zsh) to etc/zgen.zsh"
	- cd etc && ln -sf $(realpath var/repo/zgen.zsh)
