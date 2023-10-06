# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# https://releases.hashicorp.com/vault/

VERSION=1.15.0
URL="https://releases.hashicorp.com/vault/${VERSION}/vault_${VERSION}_linux_amd64.zip"


.PHONY: clean
clean:
	- rm -fr bin
	- rm -fr var


.PHONY: install
install: create-dirs download-vault unzip-vault make-symlinks


.PHONY: create-dirs
create-dirs:
	- mkdir -p bin
	- mkdir -p var
	- mkdir -p var/downloads
	- mkdir -p var/tmp


.PHONY: download-vault
download-vault:
	- wget --no-clobber ${URL} -O var/downloads/vault-${VERSION}.zip


.PHONY: unzip-vault
unzip-vault:
	- unzip var/downloads/vault-${VERSION}.zip -d bin/


.PHONY: make-symlinks
make-symlinks:
	- cd ~/bin  && ln -fs $(realpath bin/vault)


.PHONY: start-server-dev
start-server-dev:
	- bin/vault --dev


.PHONY: start-server
start-server:
	- bin/vault --config etc/vault.cfg
