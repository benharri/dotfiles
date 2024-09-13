# dotfiles

this repo is my collection of dotfiles.

it includes configs for my most frequently used tools.

## steps to install on debian and derivatives

1. `apt install make stow fish git byobu vim ripgrep fzf`
1. `make nuke install` - note that nuke removes existing files in your $HOME

## update vim packages

1. `make vim`
1. `git commit -am 'update vim submodules'`
1. profit

