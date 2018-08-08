function vim
	if test -x (which nvim)
nvim $argv
else
vim $argv
end
end
