if test -d ~/Maildir
    set -x MAIL ~/Maildir
end

for i in ~/bin ~/.local/bin ~/.rbenv/bin ~/.rbenv/shims ~/.cargo/bin ~/.yarn/bin ~/go/bin ~/.dotnet/tools ~/.local/share/fnm
    fish_add_path --path $i
end

if status --is-interactive && type -q dotnet
    complete -f -c dotnet -a "(dotnet complete (commandline -cp))"
end

status --is-login && status --is-interactive && exec byobu-launcher

