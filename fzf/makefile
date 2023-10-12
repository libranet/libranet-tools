# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# see https://github.com/junegunn/fzf

THIS_DIR=$(realpath .)

.PHONY: clean
clean:
	- rm -fr bin
	- rm -fr var

.PHONY: install
install: create-dirs clone-repo install-fzf create-symlinks move-dotfiles


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var


.PHONY: clone-repo
clone-repo:
	- git clone --depth 1 https://github.com/junegunn/fzf.git var/repo || git pull


.PHONY: install-fzf
install-fzf:
	- cd var/repo && ./install


.PHONY: update
update:
	- cd var/repo && git pull && ./install


.PHONY: create-symlinks
create-symlinks:
	- @ cd ~/bin && ln -sf ${THIS_DIR}/var/repo/bin/fzf
	- @ cd ~/bin && ln -sf ${THIS_DIR}/var/repo/bin/fzf-tmux


.PHONY: move-dotfiles
move-dotfiles:
	- mv ~/.fzf.bash ${THIS_DIR}/etc/fzf.bash-orig
	- mv ~/.fzf.zsh ${THIS_DIR}/etc/fzf.zsh-orig