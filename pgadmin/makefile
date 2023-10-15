# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

SED=`command -v gsed || command -v sed`
CMD=$(realpath bin/pgadmin4)


.PHONY: clean
clean:
	@ rm -fr bin include lib lib64 pyvenv.cfg
	@ rm -fr var


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-dotenv install-config install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-dirs
create-dirs:
	@ mkdir -p etc
	@ mkdir -p var/cache
	@ mkdir -p var/log
	@ mkdir -p var/tmp


.PHONY: create-venv
create-venv:
	- python3 -m venv .


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade pgadmin4 autoread-dotenv


.PHONY: install-dotenv
install-dotenv:
	@ echo -e "Copying .env.template to .env"
	@ cp -n .env.template .env 
	@ echo "Please review the config in .env"
	@ echo -e "Replacing string __CWD__ -> $(PWD)"
	@ $(SED) -i 's@__CWD__@'"$(PWD)"'@' .env


.PHONY: install-config
install-config:
	@ echo -e "Copying etc/pgadmin4.toml.template to etc/pgadmin4.toml"
	@ cp -n etc/pgadmin4.toml.template etc/pgadmin4.toml
	@ echo "Please review the config in etc/pgadmin4.toml"
	@ echo -e "Replacing string __CWD__ -> $(PWD)"
	@ $(SED) -i 's@__CWD__@'"$(PWD)"'@' etc/pgadmin4.toml


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}


.PHONY: run-pgadmin4
run-pgadmin4:
	bin/pgadmin4


.PHONY: open-browser
open-browser:
	@ xdg-open "http://127.0.0.1:5050/browser/"
