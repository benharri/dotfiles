function backupstatus
	ssh rsync quota
for bkp in (ssh rsync ls)
ssh rsync du -sh $bkp
end
end
