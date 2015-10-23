/proc/changemap_alt(var/datum/votablemap/VM)
	if (!istype(VM))
		return
	if (ticker.update_waiting)
		return

	log_game("Changing map to [VM.name]([VM.friendlyname])")
	shell("map_rotate.sh [VM.name].dm")
	return 0