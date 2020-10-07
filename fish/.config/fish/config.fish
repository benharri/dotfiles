status --is-login && status --is-interactive && exec byobu-launcher

set -xg EDITOR vim
set -xg TZ 'America/Detroit'

if test -d ~/Maildir
  set -x MAIL ~/Maildir
end

for i in ~/bin ~/.yarn/bin ~/.local/bin ~/.cargo/bin
  if test -d $i && not contains $i $PATH
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

