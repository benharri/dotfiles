function fish_right_prompt
    if test $CMD_DURATION
        printf %.3fs $(math $CMD_DURATION / 1000)
    end
end

