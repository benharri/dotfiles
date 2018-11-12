function is_git_dirty
	is_git; and git diff --cached --quiet
end
