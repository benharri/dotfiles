# Defined in /tmp/fish.aHcCMP/tht.fish @ line 2
function tht
	if test -f ~/.tht/bin/tht.php
        php ~/.tht/bin/tht.php $argv
    else
        echo tht not installed
    end
end
