# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# include re-usable makefiles
-include .make/*.mk

export CARGO_HOME=$(realpath .)/var/cargo
export RUSTUP_HOME=$(realpath .)/var/rustup

SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

PROFILE = default  # default|minimal|complete
DEFAULT_TOOLCHAIN := stable


.PHONY: clean
clean:
	- rm -fr bin
	- rm -fr var


.PHONY: install
install: create-dirs download-installer run-installer install-symlinks


.PHONY: create-dirs
create-dirs:
	@ mkdir -p etc
	@ mkdir -p var/tmp
	@ mkdir -p ${CARGO_HOME}/bin
	- ln -s ${CARGO_HOME}/bin bin


.PHONY: update
update: update-rust


.PHONY: download-installer
download-installer:
	- curl -fsLS https://sh.rustup.rs --output ${CARGO_HOME}/bin/install-rust.sh
	- chmod u+x ${CARGO_HOME}/bin/install-rust.sh


.PHONY: run-installer
run-installer:
	@ echo -e "Using TMPDIR: ${TMPDIR}"
	${CARGO_HOME}/bin/install-rust.sh -y --no-modify-path --profile ${PROFILE} --default-toolchain ${DEFAULT_TOOLCHAIN}


.PHONY: install-dotenv
install-dotenv:
	@ echo -e "Copying etc/basrc.template to etc/bashrc" ;\
	cp -n etc/bashrc.template etc/bashrc ;\

	@ echo -e "Replacing string __CARGO_HOME__ -> ${CARGO_HOME}" ;\
	$(SED) -i 's@__CARGO_HOME__@'"${CARGO_HOME}"'@' etc/bashrc

	@ echo -e "Replacing string __RUSTUP_HOME__ -> ${RUSTUP_HOME}" ;\
	$(SED) -i 's@__RUSTUP_HOME__@'"${RUSTUP_HOME}"'@' etc/bashrc
	@ echo "Please review the config in etc/bashrc"


.PHONY: update-rust
update-rust:
	@ echo -e "Updating rust itself."
	- bin/rustup update


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
#	@ cd ~/bin && ln -sf ${CMD}
#	ln -s  ${CARGO_HOME}/bin bin
