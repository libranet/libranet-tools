# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.


create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/cache
	@ mkdir -p var/tmp

install: create-dirs install-mermaid

install-mermaid:
	# . etc/bashrc
	npm install @mermaid-js/mermaid-cli

install-symlinks:
	@ echo -e "Symlink $(realpath bin/nvm) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/nvm)

