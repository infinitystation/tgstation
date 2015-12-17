/obj/machinery/media/jukebox/Topic(href, href_list)
	if(..() || !(Adjacent(usr) || istype(usr, /mob/living/silicon)))
		return

	if(!anchored)
		usr << "<span class='warning'>You must secure \the [src] first.</span>"
		return

	if(stat & (NOPOWER|BROKEN))
		usr << "\The [src] doesn't appear to function."
		return

	if(href_list["change_track"])
		for(var/datum/track/T in tracks)
			if(T.title == href_list["title"])
				current_track = T
				StartPlaying()
				interact(usr)
				break

	if(href_list["stop"])
		StopPlaying()

	if(href_list["play"])
		if(current_track == null)
			usr << "No track selected."
		else
			StartPlaying()

	interact(usr)
	return 1

/obj/machinery/media/jukebox/interact(mob/user)
	if(stat & (NOPOWER|BROKEN))
		usr << "\The [src] doesn't appear to function."
		return

	var/title = "RetroBox - Space Style"
	var/dat = ""

	dat += "<b>Playing - [current_track.title]<b>"
	dat += "<br/><a href='?src=\ref[src];play'>Play</a> <a href='?src=\ref[src];stop'>Stop</a><br/>"

	for(var/datum/track/T in tracks)
		dat += "<br/><a href='?src=\ref[src];change_track=[T.title]'>[T.title]</a>"

	user.set_machine(src)
	var/datum/browser/popup = new(user, "jukebox", "[title]")
	popup.set_content(dat)
	popup.open(1)
