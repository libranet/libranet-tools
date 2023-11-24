# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.


NVM_DIR=$(realpath .)/repo

VERSION=v0.39.5
URL="https://raw.githubusercontent.com/nvm-sh/nvm/${VERSION}/install.sh"


create-dirs:
	# - mkdir -p etc
	@ mkdir -p bin
	@ mkdir -p repo
	@ mkdir -p var/cache
	@ mkdir -p var/repo
	@ mkdir -p var/tmp

install: create-dirs install-nvm
# install-symlinks

install-nvm:
	# - curl -fsLS ${URL}
	curl -o- ${URL} | bash
	chmod u+x var/repo/nvm/nvm.sh

install-symlinks:
	@ echo -e "Symlink $(realpath bin/nvm) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/nvm)

nvm-ls-remote:
	nvm ls-remote

install-node-16:
	nvm install 16
	nvm which 16

install-node-17:
	nvm install 17
	nvm which 17

install-node-18:
	nvm install 18
	nvm which 18

install-node-19:
	nvm install 19
	nvm which 19

install-node-20:
	nvm install 20
	nvm which 20

install-node-21:
	. etc/bashrc
	nvm install 21
	nvm which 21
