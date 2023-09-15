# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# see https://github.com/junegunn/fzf

.PHONY: install
install: checkout-repo install-fzf


.PHONY: install-fzf
install-fzf:
	- cd repo && ./install


.PHONY: update
update:
	- cd repo && git pull && ./install