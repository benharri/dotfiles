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

Linux: bash bin byobu fish git gnupg mutt nvim vim weechat
Windows: bash git vim
Other: bash git vim

clean:
	@printf "$(RED)--- clean -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" -D bash
	stow -t "$$HOME" -D bin
	stow -t "$$HOME" -D byobu
	stow -t "$$HOME" -D fish
	stow -t "$$HOME" -D git
	stow -t "$$HOME" -D gnupg
	stow -t "$$HOME" -D mutt
	stow -t "$$HOME" -D nvim
	stow -t "$$HOME" -D vim
	stow -t "$$HOME" -D weechat

bash:
	@printf "$(YELLOW)--- bash -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" bash

bin:
	@printf "$(YELLOW)--- bin ------------------------------------------------\n$(RESET)"
	mkdir -p "$$HOME/bin"
	stow -t "$$HOME" bin
	
byobu:
	@printf "$(YELLOW)--- byobu ----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" byobu

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

vim:
	@printf "$(YELLOW)--- vim ------------------------------------------------\n$(RESET)"
	mkdir -p ~/.vim/{undodir,swap,backup}
	chmod 700 ~/.vim/{undodir,swap,backup}
	git submodule update --remote --init -- vim/.vim/pack/plugins
	stow -t "$$HOME" vim

weechat:
	@printf "$(YELLOW)--- weechat --------------------------------------------\n$(RESET)"
	stow -t "$$HOME" weechat

nuke:
	@printf "$(RED)--- nuking existing files ------------------------------\n$(RESET)"
	rm -rf ~/.byobu ~/.config/fish ~/.fzf ~/.bash*

.PHONY: bash fish git vim nvim mutt byobu weechat gnupg bin clean install nuke Windows Linux Other
