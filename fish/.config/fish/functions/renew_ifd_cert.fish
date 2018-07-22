function renew_ifd_cert
	sudo certbot certonly --agree-tos --renew-by-default --manual --preferred-challenges=dns -d ironfishdistillery.com $argv
end
