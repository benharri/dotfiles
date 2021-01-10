function md
	pandoc -s -f markdown -t html $argv[1] | lynx -stdin
end
