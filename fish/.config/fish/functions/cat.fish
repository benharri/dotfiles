function cat
	if type -q bat >/dev/null
bat $argv
else
command cat $argv
end
end
