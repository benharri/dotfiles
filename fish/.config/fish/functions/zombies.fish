function zombies
	ps -A -ostat,ppid | awk '/[zZ]/ && !a[$2]++ {print $2}'
end
