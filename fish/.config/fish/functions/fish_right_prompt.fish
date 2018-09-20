function fish_right_prompt
    if is_git
	if is_git_dirty
	    set_color --underline
	end

        set_color yellow

	if is_git_ahead
            echo -n '^'
	else
	    echo -n '='
	end
	echo -n ' '

        echo -n (git_branch)
        set_color normal
    end
end

