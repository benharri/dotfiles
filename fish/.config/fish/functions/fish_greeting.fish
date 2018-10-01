function fish_greeting
    if test -f /var/run/motd
        /bin/cat /var/run/motd
    end
end
