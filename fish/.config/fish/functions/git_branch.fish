function git_branch
	if is_git
echo (git rev-parse --abbrev-ref HEAD ^/dev/null)
end
end
