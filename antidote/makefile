# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.


TMPDIR = $(shell readlink -f var/tmp)



.PHONY: clean
clean:
	- rm -fr bin
	- rm -fr var


.PHONY: install
install: create-dirs clone-repo install-symlinks update-plugins


.PHONY: create-dirs
create-dirs:
	- mkdir -p bin
	- mkdir -p var/home
	- mkdir -p var/tmp


.PHONY: update
update:
	- cd var/repo && git pull


.PHONY: clone-repo
clone-repo:
	- git clone --depth=1 https://github.com/mattmc3/antidote.git var/repo
	- chmod u+x var/repo/antidote


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
#	@ cd ~/bin && ln -sf ${CMD}
	@ ln -sf $(realpath var/repo/antidote) bin/
	@ ln -sf $(realpath var/repo/antidote.zsh) bin/


.PHONY: update-plugins
update-plugins:
	bin/antidote bundle < etc/plugins.txt > etc/plugins.zsh


.PHONY: plugins
plugins: update-plugins