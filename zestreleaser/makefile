# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.


.PHONY: clean
clean:
	@ rm -fr bin include lib lib64 pyvenv.cfg
	@ rm -fr var


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-dirs
create-dirs:
	@ mkdir -p var/cache
	@ mkdir -p var/log
	@ mkdir -p var/tmp


.PHONY: create-venv
create-venv:
	- python3 -m venv .


.PHONY: upgrade-pip
upgrade-pip:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade zest.releaser


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Create symlinks in ~/bin/"
	@ ln -fs $(realpath bin/release) ~/bin/
	@ ln -fs $(realpath bin/fullrelease) ~/bin/
	@ ln -fs $(realpath bin/prerelease) ~/bin/
	@ ln -fs $(realpath bin/longtest) ~/bin/
