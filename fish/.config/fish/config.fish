status --is-login; and status --is-interactive; and exec byobu-launcher

if type -q nvim > /dev/null
  set -xg EDITOR nvim
else 
  set -xg EDITOR vim
end

set -xg TZ 'America/Detroit'

if test -d ~/Maildir
  set -x MAIL ~/Maildir
end

if test -d /usr/local/go
  set -x GOPATH (/usr/local/go/bin/go env GOPATH)
end

set my_paths ~/bin /usr/local/go/bin ~/.yarn/bin $GOPATH/bin ~/.local/bin ~/.cargo/bin /snap/bin ~/.fzf/bin
for path in $my_paths
  if test -d $path; and not echo $fish_user_paths | grep -q "$path"; and not echo $PATH | grep -q "$path"
    set -x fish_user_paths $fish_user_paths $path
  end
end

if test -f ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
end

set -x SSH_AGENT_PID ""
if test -S $HOME/.gnupg/S.gpg-agent
  set -x SSH_AUTH_SOCK $HOME/.gnupg/S.gpg-agent
  set -x GPG_SOCK $HOME/.gnupg/S.gpg-agent
else
  set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end

set -x BBJ_USER $USER

# load postexec_insult
postexec_insult

