# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.
#
# Please see:
#  - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

THIS_DIR=$(realpath .)


.PHONY: install
install: create-dirs download-and-install install-symlinks


.PHONY: download-and-install
download-and-install:
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "var/tmp/awscliv2.zip"
	unzip var/tmp/awscliv2.zip -d var/tmp
	var/tmp/aws/install --bin-dir ${THIS_DIR}/bin --install-dir ${THIS_DIR}/releases --update


.PHONY: create-dirs
create-dirs:
	- mkdir -p var/tmp
	- mkdir -p bin
	- mkdir -p releases


.PHONY: update
update: install


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath bin/aws) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/aws)

	@ echo -e "Symlink $(realpath bin/aws_completer) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/aws_completer)


.PHONY: clean
clean:
	- rm -fr bin 
	- rm -fr releases
	- rm -fr var