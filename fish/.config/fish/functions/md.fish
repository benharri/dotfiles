function md
	pandoc -f markdown -t html $argv[1] | lynx -stdin
end
