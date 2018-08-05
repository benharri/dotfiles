status --is-login; and status --is-interactive; and exec byobu-launcher

set -xg EDITOR nvim

set -g theme_nerd_fonts yes
set -g theme_color_scheme dark
set -g theme_display_date no

set -x MAIL /home/ben/Maildir

set -x GOPATH (/usr/local/go/bin/go env GOPATH)

set -x fish_user_paths $fish_user_paths ~/bin /usr/local/go/bin ~/.yarn/bin $GOPATH/bin ~/.local/bin ~/.cargo/bin

set -x SSH_AGENT_PID ""
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

set -x BBJ_USER $USER

