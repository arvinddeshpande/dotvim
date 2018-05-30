PATH := ./vim-themis/bin:$(PATH)
export THEMIS_VIM  := nvim
export THEMIS_ARGS := -e -s --headless
export THEMIS_HOME := ./vim-themis


install: vim-themis
	pip3 install neovim --upgrade --user
	pip3 install pytest --upgrade --user
	pip3 install flake8 --upgrade --user
	pip3 install mypy --upgrade --user
	pip3 install vim-vint --upgrade --user

lint:
	vint --version
	vint plugin
	vint autoload
	flake8 --version
	flake8 rplugin/python3/denite
	mypy --version
	mypy --silent-imports rplugin/python3/denite

test:
	themis --version
	themis test/autoload/*
	pytest --version
	pytest

vim-themis:
	git clone https://github.com/thinca/vim-themis vim-themis

.PHONY: install lint test
