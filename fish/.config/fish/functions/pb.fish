function pb
    if type -q pb > /dev/null
        command pb $argv
    else
        if count $argv > /dev/null
            curl -F'file=@'$argv[1] https://0x0.tilde.team
        else
            curl -F'file=@-;filename=stdin.txt' https://0x0.tilde.team
        end
    end
end
