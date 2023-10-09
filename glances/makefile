# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/glances)


.PHONY: clean
clean:
	- rm -fr bin include lib lib64 pyvenv.cfg share


.PHONY: install
install: create-venv create-dirs upgrade-pip install-packages install-dotenv install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-dirs
create-dirs:
	- mkdir -p var/cache
	- mkdir -p var/log
	- mkdir -p var/tmp


.PHONY: create-venv
create-venv:
	- python3 -m venv .


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	# https://github.com/nicolargo/glances
    # - bin/pip install --upgrade glances
	- bin/pip install --upgrade autoread-dotenv
	- bin/pip install --upgrade 'glances[action,browser,cloud,cpuinfo,docker,export,folders,gpu,graph,ip,raid,snmp,web,wifi]'
	- bin/pip install --upgrade sparklines
	- bin/pip install --upgrade pySMART


.PHONY: install-dotenv
install-dotenv:
	@echo -e "Copying .env.template to .env" ;\
	cp -n .env.template .env ;\
	echo "Please review the config in .env"
	@echo -e "Replacing string __CWD__ -> $(PWD)" ;\
	$(SED) -i 's@__CWD__@'"$(PWD)"'@' .env


.PHONY: install-symlinks
install-symlinks:  create-dirs
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}
	@ cd var && ln -sf ~/.cache/glances log
