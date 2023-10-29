# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.


SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

DOWNLOAD_URL='https://installers.privateinternetaccess.com/download/pia-linux-3.5-07703.run'


.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs download-installer run-installer install-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p var/piavpn
	@ mkdir -p var/tmp


.PHONY: update
update:


.PHONY: download-installer
download-installer:
	- curl -sSLf ${DOWNLOAD_URL} --output bin/install-pia.run
	- chmod u+x bin/install-pia.run


.PHONY: run-installer
run-installer:
	@ echo -e "Using TMPDIR: ${TMPDIR}"
	bin/install-pia.run --accept --confirm --keep --target var/piavpn


.PHONY: update-pia
update-pia:
	@ echo -e "Updating piavpn."


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
#	@ cd ~/bin && ln -sf ${CMD}
#	ln -s  ${CARGO_HOME}/bin bin
