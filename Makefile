YELLOW = $$(tput setaf 226)
GREEN = $$(tput setaf 46)
RED = $$(tput setaf 196)
RESET = $$(tput sgr0)

ifeq ($(OS),Windows_NT)
	UNAME = Windows
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		UNAME = Linux
	endif
	UNAME ?= Other
endif

install:
	@make $(UNAME)

Linux: bash fish git mutt byobu weechat vim nvim gnupg
Windows: bash git vim
Other: bash git vim

clean:
	@printf "$(RED)--- clean -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" -D bash
	stow -t "$$HOME" -D fish
	stow -t "$$HOME" -D git
	stow -t "$$HOME" -D vim
	stow -t "$$HOME" -D nvim
	stow -t "$$HOME" -D mutt
	stow -t "$$HOME" -D byobu
	stow -t "$$HOME" -D weechat
	stow -t "$$HOME" -D gnupg

bash:
	@printf "$(YELLOW)--- bash -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" bash

fish:
	@printf "$(YELLOW)--- fish -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" fish

git:
	@printf "$(YELLOW)--- git ------------------------------------------------\n$(RESET)"
	stow -t "$$HOME" git

vim:
	@printf "$(YELLOW)--- vim ------------------------------------------------\n$(RESET)"
	stow -t "$$HOME" vim
	[[ -f ~/.spf13-vim/bootstrap.sh ]] ||
		git submodule update --init
	~/.spf13-vim/bootstrap.sh

nvim:
	@printf "$(YELLOW)--- nvim -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" nvim

mutt:
	@printf "$(YELLOW)--- mutt -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" mutt

byobu:
	@printf "$(YELLOW)--- byobu ----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" byobu

weechat:
	@printf "$(YELLOW)--- weechat --------------------------------------------\n$(RESET)"
	stow -t "$$HOME" weechat

gnupg:
	@printf "$(YELLOW)--- gnupg ----------------------------------------------\n$(RESET)"
	mkdir -p "$$HOME/.gnupg"
	chmod 700 "$$HOME/.gnupg"
	stow -t "$$HOME" gnupg

.PHONY: bash fish git vim nvim mutt byobu weechat gnupg clean install Windows Linux Other

