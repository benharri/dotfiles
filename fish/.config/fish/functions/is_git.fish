function is_git
    git rev-parse --verify HEAD >/dev/null 2>&1
end

