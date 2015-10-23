/proc/changemap_alt(var/datum/votablemap/VM)
	if (!istype(VM))
		return
	if (ticker.update_waiting)
		return

	log_game("Changing map to [VM.name]([VM.friendlyname])")
	. = shell("sh map_rotate.sh [VM.name]")
	switch (.)
		if (null)
			message_admins("Failed to change map: Could not run map rotator")
			log_game("Failed to change map: Could not run map rotator")
		if (0)
			log_game("Changed to map [VM.friendlyname]")
			nextmap = VM

		//1x: file errors
		if (1)
			message_admins("Compile failed")
			log_game("Compile failed")