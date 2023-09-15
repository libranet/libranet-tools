# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# see https://github.com/junegunn/fzf

THIS_DIR=$(realpath .)

.PHONY: install
install: checkout-repo install-fzf create-symlinks move-dotfiles


.PHONY: install-fzf
install-fzf:
	- cd repo && ./install


.PHONY: update
update:
	- cd repo && git pull && ./install


.PHONY: create-symlinks
create-symlinks:
	- ln -sf repo/bin bin
	- @ cd ~/bin && ln -sf ${THIS_DIR}/repo/bin/fzf
	- @ cd ~/bin && ln -sf ${THIS_DIR}/repo/bin/fzf-tmux


.PHONY: move-dotfiles
move-dotfiles:
	- mv ~/.fzf.bash ${THIS_DIR}/etc/fzf.bash-orig
	- mv ~/.fzf.zsh ${THIS_DIR}/etc/fzf.zsh-orig