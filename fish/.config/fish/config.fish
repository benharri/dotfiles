status --is-login; and status --is-interactive; and exec byobu-launcher

set -xg EDITOR vim

set -g theme_nerd_fonts yes
set -g theme_color_scheme dark
set -g theme_display_date no

set -x MAIL /home/ben/Maildir

set -x GOPATH (/usr/local/go/bin/go env GOPATH)

set -x fish_user_paths $fish_user_paths ~/bin /usr/local/go/bin /home/ben/.yarn/bin $GOPATH/bin

