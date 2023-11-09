# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.
SED=`command -v gsed || command -v sed`


.PHONY: clean
clean:
	@ rm -fr bin include lib lib64 pyvenv.cfg
	@ rm -fr var


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-dotenv install-symlinks version


.PHONY: update
update: upgrade-pip install-packages version


.PHONY: create-dirs
create-dirs:
	@ mkdir -p var/cache
	@ mkdir -p var/home
	@ mkdir -p var/log
	@ mkdir -p var/tmp


.PHONY: create-venv
create-venv:
	python3 -m venv .


.PHONY: upgrade-pip
upgrade-pip:
	bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	bin/pip install --upgrade pre-commit pre-commit-hooks
	bin/pip install --upgrade autoread-dotenv


.PHONY: install-dotenv  ## generate .dotenv from template
install-dotenv:
	@ echo -e "Copying .env.template to .env"
	@ cp -n .env.template .env
	@ echo "Please review the config in .env"
	@ echo -e "Replacing string __CWD__ -> $(PWD)"
	@ $(SED) -i 's@__CWD__@'"$(PWD)"'@' .env


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath bin/pre-commit) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/pre-commit)


.PHONY: version
version:
	@ echo -e "\nCurrent version is:"
	@ bin/pre-commit --version