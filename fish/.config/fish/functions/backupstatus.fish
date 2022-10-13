function backupstatus
    ssh rsync quota
    ssh rsync du -sh "*.borg"
end
