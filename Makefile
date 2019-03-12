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

Linux: bash fish git mutt byobu weechat vim nvim gnupg bin emacs vscode sublime
Windows: bash git vim
Other: bash git vim

clean:
	@printf "$(RED)--- clean -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" -D bash
	stow -t "$$HOME" -D bin
	stow -t "$$HOME" -D byobu
	stow -t "$$HOME" -D emacs
	stow -t "$$HOME" -D fish
	stow -t "$$HOME" -D git
	stow -t "$$HOME" -D gnupg
	stow -t "$$HOME" -D mutt
	stow -t "$$HOME" -D nvim
	stow -t "$$HOME" -D sublime
	stow -t "$$HOME" -D vim
	stow -t "$$HOME" -D vscode
	stow -t "$$HOME" -D weechat

bash:
	@printf "$(YELLOW)--- bash -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" bash

bin:
	@printf "$(YELLOW)--- bin ------------------------------------------------\n$(RESET)"
	stow -t "$$HOME" bin
	
byobu:
	@printf "$(YELLOW)--- byobu ----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" byobu

emacs:
	@printf "$(YELLOW)--- emacs ----------------------------------------------\n$(RESET)"
	git submodule update --init -- emacs/.emacs.d/evil
	stow -t "$$HOME" emacs

fish:
	@printf "$(YELLOW)--- fish -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" fish

git:
	@printf "$(YELLOW)--- git ------------------------------------------------\n$(RESET)"
	stow -t "$$HOME" git

gnupg:
	@printf "$(YELLOW)--- gnupg ----------------------------------------------\n$(RESET)"
	mkdir -p "$$HOME/.gnupg"
	chmod 700 "$$HOME/.gnupg"
	stow -t "$$HOME" gnupg

mutt:
	@printf "$(YELLOW)--- mutt -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" mutt

nvim:
	@printf "$(YELLOW)--- nvim -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" nvim

sublime:
	@printf "$(YELLOW)--- sublime --------------------------------------------\n$(RESET)"
	stow -t "$$HOME" sublime

vim:
	@printf "$(YELLOW)--- vim ------------------------------------------------\n$(RESET)"
	git submodule update --init -- vim/.vim/bundle
	stow -t "$$HOME" vim

vscode:
	@printf "$(YELLOW)--- vscode ---------------------------------------------\n$(RESET)"
	stow -t "$$HOME" vscode

weechat:
	@printf "$(YELLOW)--- weechat --------------------------------------------\n$(RESET)"
	stow -t "$$HOME" weechat

.PHONY: bash fish git vim nvim mutt byobu weechat gnupg bin emacs vscode sublime clean install Windows Linux Other
