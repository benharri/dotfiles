function pubtr
    mtr -wrc4 $argv[1] > ~/pub/mtr/"$argv[1]".txt
    echo https://bhh.sh/pub/mtr/$argv[1].txt
end
