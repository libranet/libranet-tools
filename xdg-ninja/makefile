# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.


.PHONY: install
install: create-dirs clone-repo install-symlinks


.PHONY: clone-repo
clone-repo:
	- git clone https://github.com/b3nj5m1n/xdg-ninja.git repo || git pull


.PHONY: update-repo
update-repo:
	- cd repo && git pull


.PHONY: create-dirs
create-dirs:
	- mkdir -p bin


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath repo/xdg-ninja.sh) to bin/"
	@ cd bin && ln -sf $(realpath repo/xdg-ninja.sh)
	@ echo -e "Symlink $(realpath repo/xdg-ninja.sh) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath repo/xdg-ninja.sh)