# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

SED=`command -v gsed || command -v sed`


.PHONY: clean
clean:
	@ rm -fr bin include lib lib64 pyvenv.cfg
	@ rm -fr .venv
	@ rm -fr var


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/cache
	@ mkdir -p var/tmp


.PHONY: create-venv
create-venv:
	- python3 -m venv .venv


.PHONY: upgrade-pip
install:
	- .venv/bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- .venv/bin/pip install --upgrade sphinx sphinx-rtd-theme recommonmark


.PHONY: install-dotenv
install-dotenv:
	@ echo -e "Copying .env.template to .env" ;\
	cp -n .env.template .env ;\
	echo "Please review the config in .env"
	@ echo -e "Replacing string __CWD__ -> $(PWD)" ;\
	$(SED) -i 's@__CWD__@'"$(PWD)"'@' .env


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Crating symlinks from $(realpath .env/bin) to bin/"
	@ cd bin && ln -sf $(realpath .venv/bin/sphinx-build) && cd -
	@ cd bin && ln -sf $(realpath .venv/bin/pip) && cd -


.PHONY: sphinx-docs  ## generate sphinx-docs in var/html-docs
sphinx-docs:
	@ .venv/bin/sphinx-build . -b html -d var/cache/sphinx-doctrees -w var/log/sphinx-build.log var/docs/html
	@ echo "Build finished."


.PHONY : docs  ## alias for sphinx-docs
docs : sphinx-docs
