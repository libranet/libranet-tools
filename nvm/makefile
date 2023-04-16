# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

NVM_DIR=$(realpath .)/repo

VERSION=v0.39.3
URL="https://raw.githubusercontent.com/nvm-sh/nvm/${VERSION}/install.sh"



.PHONY: install
install: create-dirs install-nvm
# install-symlinks


.PHONY: install-nvm
install-nvm:
# - curl https://sh.rustup.rs -sSf | sh
# - curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	- curl -o- ${URL} | bash



.PHONY: create-dirs
create-dirs:
	# - mkdir -p etc
	- mkdir -p repo
	- mkdir -p var

.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath bin/nvm) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/nvm)


.PHONY: nvm-ls-remote
nvm-ls-remote:
	nvm ls-remote


.PHONY: install-node-16
install-node-16:
	nvm install 16
	nvm which 16


.PHONY: install-node-17
install-node-17:
	nvm install 17
	nvm which 17


.PHONY: install-node-18
install-node-18:
	nvm install 18
	nvm which 18


.PHONY: install-node-19
install-node-19:
	nvm install 19
	nvm which 19


nvm which 19                                                                                                                                                                                                                           main 
/home/wouter/.config/nvm/versions/node/v19.9.0/bin/node