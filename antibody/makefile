# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.


CMD=$(realpath bin/antibody)

TMPDIR = $(shell readlink -f var/tmp)



.PHONY: clean
clean:
	- rm -fr bin
	- rm -fr var


.PHONY: install
install: create-dirs download-installer run-installer install-symlinks update-plugins


.PHONY: create-dirs
create-dirs:
	- mkdir -p bin
	- mkdir -p var/home
	- mkdir -p var/tmp


.PHONY: update
update: install


.PHONY: download-installer
download-installer:
	- curl -fsLS https://git.io/antibody -o bin/install-antibody.sh
	- chmod u+x bin/install-antibody.sh


.PHONY: run-installer
run-installer:
	bin/install-antibody.sh -b bin


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}


.PHONY: update-plugins
update-plugins:
	bin/antibody bundle < etc/plugins.txt > etc/plugins.zsh


.PHONY: plugins
plugins: update-plugins