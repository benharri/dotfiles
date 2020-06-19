function mutt
    if type -q neomutt >/dev/null
        neomutt $argv
    else
        command mutt $argv
    end
end
