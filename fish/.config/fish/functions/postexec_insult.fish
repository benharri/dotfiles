# Defined in /tmp/fish.QnvktC/postexec_insult.fish @ line 2
function postexec_insult --on-event fish_postexec
	if test $status -ne 0
        set_color red
        echo -n =====
        set_color magenta
        echo -n (shuf -n1 ~/insults.txt)
        set_color red
        echo =====
        set_color normal
    end
end
