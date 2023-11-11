# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

THIS_DIR=$(realpath .)

clean:

install: add-repo-epel install-packages install-wslu install-symlinks

update:
	sudo dnf check-update && sudo dnf update -y

update: 
	sudo dnf check-update && sudo dnf update -y

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

install-packages:
	- sudo dnf install -y $(cat etc/rpm-packages.txt)

install-openssh:
	# https://linuxconfig.org/how-to-enable-ssh-on-almalinux
	# https://jmmv.dev/2022/02/wsl-ssh-access.html
	# https://www.hanselman.com/blog/how-to-ssh-into-wsl2-on-windows-10-from-an-external-machine
	sudo dnf install openssh-server openssh-clients
	sudo sed -i -E 's,^#?Port.*$,Port 2022,' /etc/ssh/sshd_config
	sudo systemctl enable sshd
	sudo systemctl start sshd

install-wsl-confs:
	# @ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ sudo cd /etc && ln -sf $(realpath etc/wsl.conf)
