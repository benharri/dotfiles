function fish_greeting
    if test -f /var/run/motd
        cat /var/run/motd
    end
end
