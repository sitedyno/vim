# Installs bundles and compiles things that need compiling.
#
# Credits to Mark Story: https://github.com/markstory/vim-files/blob/0a90b4cd8639da772e2bbc34dc27bd19ef53a443/Makefile
#
help:
	@echo "install - install bundles and compile things if needed."
	@echo "update - Git pull updates for all bundles."

install: symlink submodules

submodules:
	git submodule update --init

update:
	git submodule foreach git pull origin master

symlink:
	cd ~ && ln -sf .vim/vimrc ~/.vimrc
	cd ~ && ln -sf .vim/gvimrc ~/.gvimrc

