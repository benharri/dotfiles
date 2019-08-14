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

Linux: bash fzf fish git mutt byobu weechat vim nvim gnupg bin vscode sublime
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
	stow -t "$$HOME" -D sublime
	stow -t "$$HOME" -D vim
	stow -t "$$HOME" -D vscode
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

fzf: fish
	@printf "$(YELLOW)--- fzf ------------------------------------------------\n$(RESET)"
	git submodule update --remote --init -- fzf/.fzf
	stow -t "$$HOME" fzf
	~/.fzf/install --no-bash --no-zsh --no-completion --no-update-rc --key-bindings --64

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
	mkdir -p ~/.vim/{undodir,swap,backup}
	chmod 700 ~/.vim/{undodir,swap,backup}
	git submodule update --remote --init -- vim/.vim/bundle
	stow -t "$$HOME" vim

vscode:
	@printf "$(YELLOW)--- vscode ---------------------------------------------\n$(RESET)"
	stow -t "$$HOME" vscode

weechat:
	@printf "$(YELLOW)--- weechat --------------------------------------------\n$(RESET)"
	stow -t "$$HOME" weechat

nuke:
	@printf "$(RED)--- nuking existing files ------------------------------\n$(RESET)"
	rm -rf ~/.byobu ~/.config/fish ~/.fzf ~/.bash*

.PHONY: bash fzf fish git vim nvim mutt byobu weechat gnupg bin vscode sublime clean install nuke Windows Linux Other
