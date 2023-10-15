https://www.liquidweb.com/kb/install-postgresql-almalinux/



dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm

dnf install -y postgresql15 postgresql15-server



psql --version

/usr/pgsql-15/bin/postgresql-15-setup initdb



 sudo /usr/pgsql-15/bin/postgresql-15-setup initdb

sudo password postgres


mkdir -p /home/wouter/.cache/psql

sudo -u postgres psql -c 'SHOW config_file'

 psql -h 127.0.0.1 --user postgres
