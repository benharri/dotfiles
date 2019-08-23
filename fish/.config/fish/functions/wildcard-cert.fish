function wildcard-cert
    sudo certbot certonly                                       \
        --dns-rfc2136                                           \
        --dns-rfc2136-credentials /root/.secrets/rfc2136.ini    \
        --server https://acme-v02.api.letsencrypt.org/directory \
        --preferred-challenge dns-01                            \
        --cert-name $argv[1]                                    \
        -d $argv[1]                                             \
        -d \*.$argv[1]
end

