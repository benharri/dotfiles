function lg
    if type -q lazygit > /dev/null
        lazygit $argv
    else
        git status
    end
end

