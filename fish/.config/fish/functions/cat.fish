function cat
    if type -q bat >/dev/null
        bat -p $argv
    else
        command cat $argv
    end
end

