function certexpiry
    openssl s_client -connect $argv[1] </dev/null 2>/dev/null | openssl x509 -noout -dates
end
