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

for i in ~/bin /usr/local/go/bin ~/.yarn/bin $GOPATH/bin ~/.local/bin ~/.cargo/bin /snap/bin ~/.fzf/bin
  if test -d $i; and not contains $i $PATH
    set -x fish_user_paths $fish_user_paths $i
  end
end

#set -x SSH_AGENT_PID ""
if test -S $HOME/.gnupg/S.gpg-agent
  set -x SSH_AUTH_SOCK $HOME/.gnupg/S.gpg-agent
  set -x GPG_SOCK $HOME/.gnupg/S.gpg-agent
else
  set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end

set -x BBJ_USER $USER

# load postexec_insult
postexec_insult

