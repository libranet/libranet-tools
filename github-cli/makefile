# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.
#
# Please see:
#  - https://cli.github.com/
#  - https://github.com/cli/cli/blob/trunk/docs/install_linux.md


.PHONY: install
install:
	sudo dnf install -y 'dnf-command(config-manager)'
	sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
	sudo dnf install -y gh

