# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.


SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)
VERSION=16

.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs add-repo install-postgres init-db version


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p etc
	@ mkdir -p var/tmp


.PHONY: add-repo
add-repo:
	sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm


# https://www.tecmint.com/install-postgresql-rocky-linux/
# sudo dnf -qy module disable postgresql

.PHONY: install-postgres
install-postgres:
	sudo dnf install -y postgresql${VERSION} postgresql${VERSION}-server


.PHONY: fix-pg-config
fix-pg-config:
	sudo alternatives --install /usr/bin/pg_config pgsql-pg_config /usr/pgsql-16/bin/pg_config 930


.PHONY: init-db
init-db:
	sudo /usr/pgsql-${VERSION}/bin/postgresql-${VERSION}-setup initdb


.PHONY: version
version:
	@ echo -e "Version psql:"
	@ psql --version


.PHONY: status
status:
	sudo systemctl status postgresql-${VERSION}


.PHONY: set
set:
	sudo su - postgres && psql


.PHONY: enable
enable:
	sudo systemctl enable postgresql-${VERSION}


.PHONY: start
start:
	sudo systemctl start postgresql-${VERSION}


.PHONY: stop
stop:
	sudo systemctl stop postgresql-${VERSION}


.PHONY: install-symlinks
install-symlinks:
#	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD} hadolint



.PHONY: change-password
change-password:
	# sudo -u postgres psql -c "SELECT 1"
	sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '123'"


.PHONY: psql
psql: 
	sudo -u postgres psql
