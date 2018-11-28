function is_git
    git rev-parse --verify HEAD >/dev/null ^&1
end

