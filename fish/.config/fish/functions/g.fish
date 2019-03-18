complete -c g -w git

function g
    if count $argv > /dev/null
        git $argv
    else
        git status
    end
end

