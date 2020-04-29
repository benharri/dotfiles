# Defined in /tmp/fish.7MQgge/backupstatus.fish @ line 2
function backupstatus
    ssh rsync quota
    ssh rsync du -sh "*.borg"
end
