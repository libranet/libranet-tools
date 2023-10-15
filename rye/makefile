# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# https://rye-up.com/guide/installation/
.ONESHELL:

export RYE_HOME=$(realpath .)/var/home
export TMP=$(realpath var/tmp)

.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr home
	@ rm -fr var


.PHONY: install
install: create-dirs install-rye install-symlinks


.PHONY: update
update: update-rye


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p etc
	@ mkdir -p var/tmp


.PHONY: install-rye
install-rye:
	@ export RYE_HOME=$(realpath .)/var/home
	@ export RYE_VERSION='latest'
	@ export RYE_INSTALL_OPTION='--yes'
	curl -fsLS https://rye-up.com/get --output bin/rye-installer.sh
	@ chmod u+x bin/rye-installer.sh
	@ echo -e "${TMP} , ${RYE_HOME}"
	@ bin/rye-installer.sh


.PHONY: update-rye
update-rye:
	rye self update


.PHONY: install-symlinks
install-symlinks:
	@ export RYE_HOME=$(realpath .)/home
	@ echo -e "Creating symlinks ${RYE_HOME}/shims/rye/* to bin/"
	@ cd bin && ln -sf ${RYE_HOME}/shims/rye && cd - 
	@ cd bin && ln -sf ${RYE_HOME}/shims/python && cd - 
	@ cd bin && ln -sf ${RYE_HOME}/shims/python3 && cd - 
	@ cd etc && ln -sf ${RYE_HOME}/env && cd - 
