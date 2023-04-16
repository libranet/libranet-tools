# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.


CMD := $(realpath repo/xdg-ninja.sh)

.PHONY: install
install: clone-repo install-symlinks


.PHONY: clone-repo
clone-repo:
	- git clone https://github.com/b3nj5m1n/xdg-ninja.git repo


.PHONY: update-repo
update-repo:
	- cd repo && git pull


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}