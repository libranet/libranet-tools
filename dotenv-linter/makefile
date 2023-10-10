# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

SED=`command -v gsed || command -v sed`
CMD=$(realpath bin/dotenv-linter)


.PHONY: clean
clean:
	- rm -fr bin include lib lib64 pyvenv.cfg
	- rm -fr var


.PHONY: install
# install: create-dirs create-venv upgrade-pip install-packages install-symlinks
install: create-dirs install-cargo-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-dirs
create-dirs:
	- mkdir -p var/cache
	- mkdir -p var/tmp


.PHONY: install-cargo-packages
install-cargo-packages:
	- cargo install dotenv-linter

.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}
