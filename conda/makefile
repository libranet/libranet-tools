# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# CANONICAL_SCRIPT_DIR=$(readlink -f "$(dirname "$(readlink -f "$0")")")
MINICONDA_INSTALLER=$(mktemp -t miniconda3-latest-linux-x86_64.sh-XXXXXXXXXX)
MINICONDA_INSTALLER=Miniconda3-latest-Linux-x86_64.sh
MINICONDA_DOWNLOAD_URL="https://repo.anaconda.com/miniconda/${MINICONDA_INSTALLER}"
PREFIX=$(realpath .)
NOW=$(date +"%Y-%m-%d %H:%M:S")
SED=`command -v gsed || command -v sed`


export TMP := var/tmp


.PHONY: clean
clean:
	- rm -fr var


.PHONY: install
install:  \
	check-64bit \
	create-dirs \
	download-installer \
	install-miniconda \
	update-conda-self \
	install-dotenv \
	install-condarc \
	install-bashrc \
	update-conda-packages \
	install-conda-packages \
	install-pip-packages \
	install-symlinks


.PHONY: update
update: update-conda-self update-conda-packages


.PHONY: check-64bit
check-64bit:
    ARCHITECTURE=$(shell uname -m); \
    if [ "$$ARCHITECTURE" = "x86_64" ]; then \
        :; \
    else \
        echo -e "Architecture ${ARCHITECTURE} not supported. We expect x86_64"; \
    fi


.PHONY: create-dirs
create-dirs:
	# - mkdir -p ~/bin
	- mkdir -p bin
	- mkdir -p etc
	- mkdir -p var/cache
	- mkdir -p var/cache-pip
	- mkdir -p var/downloads
	- mkdir -p var/log
	- mkdir -p var/tmp
	

.PHONY: download-installer
download-installer:
	@ echo -e "\nDownloading miniconda-installer for 64bit-linux in ${MINICONDA_INSTALLER}."
	@ echo -e "This might take a while.\n"
	curl -SfL ${MINICONDA_DOWNLOAD_URL} --output var/downloads/${MINICONDA_INSTALLER}


.PHONY: install-miniconda
install-miniconda:
	@ echo -e "\nInstalling miniconda in ${PREFIX}"
	chmod u+x var/downloads/${MINICONDA_INSTALLER}
	bash "var/downloads/${MINICONDA_INSTALLER}" -b -u -p ${PREFIX}
	mv var/downloads/${MINICONDA_INSTALLER} ${PREFIX}/bin/miniconda3-latest-linux-x86_64-{DATE}.sh


.PHONY: install-dotenv
install-dotenv:
	@echo -e "Copying .env.template to .env" ;\
	cp -n .env.template .env ;\
	echo "Please review the config in .env"
	@echo -e "Replacing string __CWD__ -> $(PWD)" ;\
	$(SED) -i 's@__CWD__@'"$(PWD)"'@' .env


.PHONY: install-condarc
install-condarc:
	@echo -e "Copying etc/condarc.template to etc/condarc" ;\
	cp -n etc/condarc.template etc/condarc ;\
	echo "Please review the config in etc/condarc."
	@echo -e "Replacing string __CWD__ -> $(PWD)" ;\
	$(SED) -i 's@__CWD__@'"$(PWD)"'@'   etc/condarc


.PHONY: install-pipconf
install-pipconf:
	@echo -e "Copying etc/pip.conf.template to etc/pip.conf" ;\
	cp -n etc/pip.conf.template etc/pip.conf ;\
	echo "Please review the config in etc/pip.conf."
	@echo -e "Replacing string __CWD__ -> $(PWD)" ;\
	$(SED) -i 's@__CWD__@'"$(PWD)"'@'   etc/pip.conf


.PHONY: install-bashrc
install-bashrc:
	@echo -e "Copying etc/bashrc.template to etc/bashrc" ;\
	cp -n etc/bashrc.template etc/bashrc ;\
	echo "Please review the config in etc/bashrc."
	@echo -e "Replacing string __CWD__ -> $(PWD)" ;\
	$(SED) -i 's@__CWD__@'"$(PWD)"'@'   etc/bashrc


.PHONY: update-conda-self
update-conda-self:
	@ echo -e "Updating the conda-package itself."
	bin/conda update -n base -c defaults conda --yes


.PHONY: update-conda-packages
update-conda-packages:
	@ echo -e "\n: Updating the conda-packages"
	bin/conda" update --all --yes


.PHONY: install-conda-packages
install-conda-packages:
	@ echo -e "\nInstalling conda-packages in the base-environment"
	bin/conda" install conda-build --name base --yes
	bin/conda" install mamba --name base --channel conda-forge --yes
	bin/conda" install micromamba --name base --channel conda-forge --yes


.PHONY: install-pip-packages
install-pip-packages:


.PHONY: install-symlinks
install-symlinks:
	cd ~/bin && ln -sf $(realpath bin/conda)
	cd ~/bin && ln -sf $(realpath bin/conda-env)
	cd ~/bin && ln -sf $(realpath bin/mamba)
	cd ~/bin && ln -sf $(realpath bin/mamba-package)
	cd ~/bin && ln -sf $(realpath bin/micromamba)
	# cd ~/bin && ln -sf $(realpath bin/activate)
	# cd ~/bin && ln -sf $(realpath bin/deactivate)
