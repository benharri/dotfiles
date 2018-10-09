function wildcard-cert
	sudo certbot certonly \
     --dns-cloudflare \
     --dns-cloudflare-credentials /root/.secrets/cloudflare.ini \
     --server https://acme-v02.api.letsencrypt.org/directory \
     --preferred-challenge dns-01 \
     --cert-name $argv[1] \
     -d $argv[1] \
     -d \*.$argv[1]
end
