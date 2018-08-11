function vim
    if type -q nvim >/dev/null
        nvim $argv
    else
        command vim $argv
    end
end

