# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

SED=`command -v gsed || command -v sed`
CMD=$(realpath bin/locust)


clean:
	@ rm -fr bin include lib lib64 pyvenv.cfg
	@ rm -fr var

create-dirs:
	@ mkdir -p etc
	@ mkdir -p var/cache
	@ mkdir -p var/tmp

install: create-dirs create-venv upgrade-pip install-packages install-dotenv install-symlinks

update: upgrade-pip install-packages

create-venv:
	python3 -m venv .

install:
	bin/python -m pip install --upgrade pip

install-packages:
	bin/pip install --upgrade locust autoread-dotenv

install-dotenv:
	@ echo -e "Copying .env.template to .env" ;\
	cp -n .env.template .env ;\
	echo "Please review the config in .env"
	@ echo -e "Replacing string __CWD__ -> $(PWD)" ;\
	$(SED) -i 's@__CWD__@'"$(PWD)"'@' .env

install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}
