# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/oh-my-posh)

# Define the variable to hold the current directory
BASE_DIR := $(CURDIR)

.PHONY: install
install: create-dirs install-executable install-themes install-symlinks enable-bashrc enable-zshrc download-fonts


.PHONY: update
update: install-executable


.PHONY: create-dirs
create-dirs:
	- mkdir -p bin
	- mkdir -p etc
	- mkdir -p var
	- mkdir -p var/tmp
    # avoid files like ~/omp.cache because cache-dir did not exist.
	- mkdir -p ~/.cache/oh-my-posh  


.PHONY: install-executable
 install-executable: create-dirs
	# install executable
	wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O bin/oh-my-posh
	chmod u+x bin/oh-my-posh


.PHONY: install-themes
install-themes: 
	# install themes
	mkdir -p var/themes
	wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O  var/tmp/themes.zip
	unzip var/tmp/themes.zip -d var/themes
	chmod u+rw var/themes/*.omp.*


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}


.PHONY: enable-bashrc
enable-bashrc: 
	echo -e '\n\nsource ${BASE_DIR}/etc/bashrc' >> ~/.bashrc


.PHONY: enable-zshrc
enable-zshrc: 
	echo -e '\n\nsource ${BASE_DIR}/etc/zshrc' >> ~/.zshrc


.PHONY: download-fonts
download-fonts: 
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip -P var/tmp
