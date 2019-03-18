function is_git
    git rev-parse --verify HEAD >/dev/null ^&1
    # keeping ^ for now for v2 backwards compatibility
end

