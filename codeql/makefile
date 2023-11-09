# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.


.PHONY: clean
clean:
	@ rm -fr codeql
	@ rm -fr var


.PHONY: install
install: create-dirs download install-symlinks


.PHONY: update
update:
	@ echo -e "Update not supported."
	@ echo -e "check new releases at https://github.com/github/codeql-action/releases/download"


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p etc
	@ mkdir -p var/downloads


.PHONY: download
download:
	wget https://github.com/github/codeql-action/releases/download/codeql-bundle-v2.14.6/codeql-bundle-linux64.tar.gz -P var/downloads
	tar xzf var/tmp/codeql-bundle-linux64.tar.gz


# .PHONY: install-configfile
# install-configfile:
# 	@echo -e "Copying etc/cookiecutterrc.template to etc/cookiecutterrc" ;\
# 	cp -n etc/cookiecutterrc.template etc/cookiecutterrc ;\
# 	echo "Please review the config in etc/cookiecutterrc."
# 	@echo -e "Replacing string __BASE_DIR__ -> $(PWD)" ;\
# 	$(SED) -i 's@__BASE_DIR__@'"$(PWD)"'@'   etc/cookiecutterrc


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath bin/cookiecutter) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/cookiecutter)
