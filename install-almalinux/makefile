# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

THIS_DIR=$(realpath .)


.PHONY: clean
clean:


.PHONY: install
install: create-venv install-packages install-symlinks


.PHONY: update
update: 
	sudo dnf check-update && sudo dnf update -y

.PHONY: add-repo-epel
add-repo-epel: 
    # https://www.linuxcapable.com/how-to-install-enable-epel-epel-next-on-almalinux-9/
    sudo dnf upgrade --refresh -y
    sudo dnf config-manager --set-enabled crb
    sudo dnf install -y \
        https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
        https://dl.fedoraproject.org/pub/epel/epel-next-release-latest-9.noarch.rpm



.PHONY: install-packages
install-packages:
	- sudo dnf install -y $(cat etc/rpm-packages.txt)


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}
