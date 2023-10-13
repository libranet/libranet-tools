# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# see https://github.com/wting/autojump

THIS_DIR=$(realpath .)

.PHONY: clean
clean:
	- rm -fr bin
	- rm -fr var


.PHONY: install
install: create-dirs clone-repo install-autojump create-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p etc/profile.d
	@ mkdir -p var
	@ mkdir -p var/home


.PHONY: clone-repo
clone-repo:
	# - git clone https://github.com/wting/autojump.git var/repo || git pull
	- git clone https://github.com/woutervh/autojump.git var/repo || git pull


.PHONY: install-autojump
install-autojump:
	# - cd var/repo && ./install.py --destdir ${THIS_DIR} -zshshare ${THIS_DIR}
	- cd var/repo && ./install.py --destdir ${THIS_DIR}/var/home


.PHONY: update
update:
	- cd var/repo && git pull && ./install.py


.PHONY: create-symlinks
create-symlinks:
	- ln -s $(realpath var/repo/bin) bin
