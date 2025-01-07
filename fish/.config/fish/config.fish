if test -d ~/Maildir
  set -x MAIL ~/Maildir
end

for i in ~/bin ~/.local/bin ~/.rbenv/bin ~/.rbenv/shims ~/.cargo/bin ~/.yarn/bin ~/go/bin ~/.dotnet/tools
  fish_add_path --path $i
end

# add rbenv paths
if status --is-interactive && type -q rbenv
  set -gx RBENV_SHELL fish
  source '/usr/lib/rbenv/completions/rbenv.fish'

  command rbenv rehash 2>/dev/null

  function rbenv
    set command $argv[1]
    set -e argv[1]

    switch "$command"
    case rehash shell
      source (rbenv "sh-$command" $argv|psub)
    case '*'
      command rbenv "$command" $argv
    end
  end
end

if test -S $HOME/.gnupg/S.gpg-agent
  set -x SSH_AUTH_SOCK $HOME/.gnupg/S.gpg-agent
  set -x GPG_SOCK $HOME/.gnupg/S.gpg-agent
else
  type -q gpgconf && set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end

# add dotnet completions if needed
if status --is-interactive && type -q dotnet
  complete -f -c dotnet -a "(dotnet complete)"
end

status --is-login && status --is-interactive && exec byobu-launcher

