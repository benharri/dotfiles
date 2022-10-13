# Defined in /tmp/fish.Fo1L3P/pubtr.fish @ line 1
function pubtr
    mtr -wrc4 $argv[1] > ~/pub/mtr/"$argv[1]".txt
    echo https://bhh.sh/pub/mtr/$argv[1].txt
end
