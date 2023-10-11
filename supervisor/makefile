# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

SED=`command -v gsed || command -v sed`
CMD=$(realpath bin/supervisor)


.PHONY: clean
clean:
	- rm -fr bin include lib lib64 pyvenv.cfg
	- rm -fr var


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-dotenv install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-dirs
create-dirs:
	- mkdir -p var/cache
	- mkdir -p var/log
	- mkdir -p var/run
	- mkdir -p var/tmp


.PHONY: create-venv
create-venv:
	- python3 -m venv .


.PHONY: upgrade-pip
upgrade-pip:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade supervisor autoread-dotenv


.PHONY: install-dotenv
install-dotenv:
	@echo -e "Copying .env.template to .env" ;\
	cp -n .env.template .env ;\
	echo "Please review the config in .env"
	@echo -e "Replacing string __CWD__ -> $(PWD)" ;\
	$(SED) -i 's@__CWD__@'"$(PWD)"'@' .env


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}



