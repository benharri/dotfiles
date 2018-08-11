# Defined in /tmp/fish.hXQA9y/cp_tilde_index.fish @ line 1
function cp_tilde_index
    sudo cp /etc/skel/public_html/index.php /home/$argv[1]/public_html/.
    sudo chown $argv[1]:$argv[1] /home/$argv[1]/public_html/index.php
    if test -e /home/$argv[1]/public_html/index.html
        sudo rm /home/$argv[1]/public_html/index.html
    end
end
