# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# see https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli


# https://github.com/hashicorp/terraform/pull/31952
# https://github.com/hashicorp/terraform/issues/15389
# generates unwanted $HOME/.terraform.d/checkpoint_signature

# .PHONY: clean
# clean:
# 	- rm -fr bin include lib lib64 pyvenv.cfg
VERSION=1.6.1
URL=https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip


.PHONY: install
install: add-repo install-rpm install-autocomplete install-docs


.PHONY: add-repo
add-repo:
	- sudo dnf check-update
	- sudo dnf install -y dnf-plugins-core
	- sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo


.PHONY: install-rpm
install-rpm:
	- sudo dnf -y install terraform


.PHONY: install-autocomplete
install-autocomplete:
	- terraform -install-autocomplete  2> /dev/null


.PHONY: install-docs
install-docs:
	# available releases: https://github.com/terraform-docs/terraform-docs/tags
	- go install github.com/terraform-docs/terraform-docs@v0.16.0


.PHONY: install-symlinks
install-symlinks:
	@ mkdir -p bin
	- cd bin && ln -sf `which terraform`
