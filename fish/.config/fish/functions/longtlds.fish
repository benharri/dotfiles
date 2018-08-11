function longtlds
    wget -qO - http://data.iana.org/TLD/tlds-alpha-by-domain.txt | tail -n+2 | awk '{print length, $0;}' | sort -n $argv
end

