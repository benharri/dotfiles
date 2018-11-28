function is_git_dirty
    # based on https://github.com/git/git/blob/master/git-sh-setup.sh#L210

	is_git; or return 1

    if git diff-files --quiet --ignore-submodules 
        or git diff-index --cached --quiet --ignore-submodules HEAD --
        return 1
    else
        return 0
    end
end

