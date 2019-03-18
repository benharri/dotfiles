complete -c l -w ls

function l
	ls -lah --group-directories-first $argv
end

