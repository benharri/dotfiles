status --is-login; and status --is-interactive; and exec byobu-launcher

set -xg EDITOR nvim

set -g theme_nerd_fonts yes
set -g theme_color_scheme dark
set -g theme_display_date no

if test -d ~/Maildir
  set -x MAIL ~/Maildir
end

if test -d /usr/local/go
  set -x GOPATH (/usr/local/go/bin/go env GOPATH)
end

set user_paths ~/bin /usr/local/go/bin ~/.yarn/bin $GOPATH/bin ~/.local/bin ~/.cargo/bin /snap/bin ~/.fzf/bin
for path in $user_paths
  if test -d $path
    set -x fish_user_paths $fish_user_paths $path
  end
end

set -x SSH_AGENT_PID ""
if test -S $HOME/.gnupg/S.gpg-agent
  set -x SSH_AUTH_SOCK $HOME/.gnupg/S.gpg-agent
  set -x GPG_SOCK $HOME/.gnupg/S.gpg-agent
else
  set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end

set -x BBJ_USER $USER

