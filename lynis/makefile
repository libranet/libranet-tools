# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# see https://github.com/CISOfy/Lynis

THIS_DIR=$(realpath .)

.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs clone-repo create-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var
	@ mkdir -p var/log


.PHONY: clone-repo
clone-repo:
	git clone https://github.com/woutervh/lynis var/repo || git pull


.PHONY: update
update:
	cd var/repo && git pull


.PHONY: create-symlinks
create-symlinks:
	@ cd bin && ln -sf ${THIS_DIR}/var/repo/lynis
	@ cd ~/bin && ln -sf ${THIS_DIR}/var/repo/lynis


.PHONY: audit
audit:
	cd var/repo/ && ./lynis audit system
