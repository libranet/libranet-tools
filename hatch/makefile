# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/hatch)


clean:
	@ rm -fr bin include lib lib64 pyvenv.cfg
	@ rm -fr var

create-dirs:
	@ mkdir -p var/cache

install: create-dirs create-venv upgrade-pip install-packages install-symlinks version

update: upgrade-pip install-packages version

create-venv:
	python3 -m venv .

upgrade-pip:
	bin/python -m pip install --upgrade pip

install-packages:
	bin/pip install --upgrade hatch

install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}

version:
	@ echo -e "\nCurrent version is:"
	@ bin/hatch --version
