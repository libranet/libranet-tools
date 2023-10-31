# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs clone-repo install-symlinks


.PHONY: update
update: create-dirs update-repo install-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var


.PHONY: clone-repo
clone-repo:
	- git clone https://github.com/b3nj5m1n/xdg-ninja.git var/repo


.PHONY: update-repo
update-repo:
	- cd var/repo && git pull && cd -


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath var/repo/xdg-ninja.sh) to bin/"
	- cd bin && ln -sf $(realpath var/repo/xdg-ninja.sh)
	@ echo -e "Symlink $(realpath var/repo/xdg-ninja.sh) to ${HOME}/bin/"
	- cd ~/bin && ln -sf $(realpath var/repo/xdg-ninja.sh)


.PHONY: install-glow-centos
install-glow:
	- sudo etc/charm.repo /etc/yum.repos.d/
	- sudo dnf install glow


# see https://github.com/charmbracelet/glow
.PHONY: install-glow-opensuse
install-glow-opensuse:
	- sudo etc/charm.repo /etc/yum.repos.d/
	- sudo zypper install glow
