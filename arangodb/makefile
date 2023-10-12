# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

.PHONY: install
install: download install-symlinks



.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Create symlinks in ~/bin/"
	# - ln -fs $(realpath bin/release) ~/bin/


.PHONY: download
download:
	- wget https://download.arangodb.com/arangodb310/Community/Linux/arangodb3-client-linux-3.10.4_x86_64.tar.gz
	- wget https://download.arangodb.com/arangodb310/Community/Linux/arangodb3-linux-3.10.4_x86_64.tar.gz
