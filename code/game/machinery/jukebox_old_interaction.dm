/obj/machinery/media/jukebox/ui_act(action, params)
	if(..())
		return

	switch(action)
		if("change_track")
			for(var/datum/track/T in tracks)
				if(T.title == params["title"])
					current_track = T
					StartPlaying()
					break

		if("stop")
			StopPlaying()

		if("play")
			if(current_track == null)
				usr << "No track selected."
			else
				StartPlaying()

	return 1

/obj/machinery/media/jukebox/interact(mob/user)
	if(stat & (NOPOWER|BROKEN))
		usr << "\The [src] doesn't appear to function."
		return

	ui_interact(user)

/obj/machinery/media/jukebox/get_ui_data(mob/user)
	var/data = list()

	data["current_track"] = current_track != null ? current_track.title : ""
	data["playing"] = playing

	var/list/nano_tracks = new
	for(var/datum/track/T in tracks)
		nano_tracks[++nano_tracks.len] = list("track" = T.title)

	data["tracks"] = nano_tracks

	return data

/obj/machinery/media/jukebox/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 0)
	//var/title = "RetroBox - Space Style"
	ui = SSnano.try_update_ui(user, src, ui_key, ui, force_open = force_open)
	if (!ui)
		ui = new(user, src, ui_key, name, name, 480, 660)
		ui.open()
