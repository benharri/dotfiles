function vz
	set file (fzf --height 40% --reverse)
	if test -f $file
		vim $file
	end
end

