# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

THIS_DIR=$(realpath .)


.PHONY: clean
clean:


.PHONY: install
install: add-repo-epel install-packages install-wslu install-symlinks


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
	# https://linux.how2shout.com/enable-crb-code-ready-builder-powertools-in-almalinux-9/
	sudo dnf config-manager --set-enabled crb


install-wslu:
	# see https://linux.how2shout.com/enable-crb-code-ready-builder-powertools-in-almalinux-9/
	# ensure data is correct: sudo date --set "2023-09-25 10:00:00
	sudo dnf update
	sudo dnf install yum-utils
	sudo dnf config-manager --set-enabled crb
	sudo dnf copr enable wslutilities/wslu -y
	sudo dnf install wslu


.PHONY: install-packages
install-packages:
	- sudo dnf install -y $(cat etc/rpm-packages.txt)


.PHONY: install-symlinks
install-symlinks:
	# @ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	# @ cd ~/bin && ln -sf ${CMD}
