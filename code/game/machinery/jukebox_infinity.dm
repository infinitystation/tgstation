//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32
datum/track
	var/title
	var/sound

datum/track/New(var/title_name, var/audio)
	title = title_name
	sound = audio

/obj/machinery/media/jukebox/
	name = "space jukebox"
	icon = 'icons/obj/jukebox.dmi'
	desc = "Looks like genereic ancient jukebox but a bit spacey."
	icon_state = "jukebox2-nopower"
	var/state_base = "jukebox2"
	anchored = 1
	density = 1
	power_channel = EQUIP
	use_power = 1
	idle_power_usage = 10
	active_power_usage = 100

	var/playing = 0

	var/datum/track/current_track
	var/list/datum/track/tracks = list(
		new/datum/track("American Authors - What We Live For", 'sound/playlist/american-authors-what-we-live-for.ogg'),
		new/datum/track("Back To Future OST - Back To Future", 'sound/playlist/Back-To-Future.ogg'),
		new/datum/track("Disciples - They Don't know", 'sound/playlist/disciples-they-don-t-know.ogg'),
		new/datum/track("Madcon - Don't Worry", 'sound/playlist/madcon-feat-dont-worry.ogg'),
		new/datum/track("MIA - Paper Planet", 'sound/playlist/mia-paper-planet.ogg'),
		new/datum/track("ONE-OK-ROCK - Answer Is Near", 'sound/playlist/one-ok-rock-answer-is-near.ogg'),
		new/datum/track("Imagine Dragons - Radioactive", 'sound/playlist/Radioactive.ogg'),
		new/datum/track("Yiruma - River Flows In You", 'sound/playlist/river-flows-in-you.ogg'),
		new/datum/track("Sam Brown - Stop", 'sound/playlist/sam-brown-stop.ogg'),
		new/datum/track("Taio Cruz feat - Hangover", 'sound/playlist/Taio_Cruz_feat-Hangover.ogg'),
		new/datum/track("The_White_Stripes - The Hardest Button To Button", 'sound/playlist/The_Hardest_Button_To_Button-The_White_Stripes.ogg'),
		new/datum/track("Twisted Sister - I wanna rock", 'sound/playlist/twisted-sister-i-wanna-rock.ogg'),
		new/datum/track("Brat 2 OST - Vechno Molodoj", 'sound/playlist/vechno-molodoj-brat2.ogg'),
		new/datum/track("Victor Tsoy - Kukushka", 'sound/playlist/Victor Tsoy - Kukushka.ogg')
	)

/obj/machinery/media/jukebox/New()
	..()
	update_icon()

/obj/machinery/media/jukebox/Destroy()
	StopPlaying()
	..()



/obj/machinery/media/jukebox/power_change()
	if(!powered(power_channel) || !anchored)
		stat |= NOPOWER
	else
		stat &= ~NOPOWER

	if(stat & (NOPOWER|BROKEN) && playing)
		StopPlaying()
	update_icon()

/obj/machinery/media/jukebox/update_icon()
	overlays.Cut()
	if(stat & (NOPOWER|BROKEN) || !anchored)
		if(stat & BROKEN)
			icon_state = "[state_base]-broken"
		else
			icon_state = "[state_base]-nopower"
		return
	icon_state = state_base
	if(playing)
		overlays += "[state_base]-running"

/obj/machinery/media/jukebox/attack_hand(mob/user)
	src.add_fingerprint(user)
	..()

/obj/machinery/media/jukebox/attackby(obj/item/W as obj, mob/user as mob)
	src.add_fingerprint(user)

	if (istype(user, /mob/living/silicon) && get_dist(src,user)>1)
		return src.attack_hand(user)

	if(istype(W, /obj/item/weapon/wrench))
		if(playing)
			StopPlaying()
		user.visible_message("<span class='warning'>[user] has [anchored ? "un" : ""]secured \the [src].</span>", "<span class='notice'>You [anchored ? "un" : ""]secure \the [src].</span>")
		anchored = !anchored
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		power_change()
		update_icon()
		return

	return ..()

/obj/machinery/media/jukebox/proc/StopPlaying()
	var/area/A = get_area(src)
	A.forced_ambience = null

	// Always kill the current sound
	for(var/mob/living/M in mobs_in_area(A))
		M << sound(null, channel = 1)

	playing = 0
	use_power = 1
	update_icon()


/obj/machinery/media/jukebox/proc/StartPlaying()
	StopPlaying()
	if(!current_track)
		return

	var/area/A = get_area(src)
	A.forced_ambience = sound(current_track.sound, channel = 1)

	for(var/mob/living/M in mobs_in_area(A))
		if(M.mind)
			A.play_ambience(M)

	playing = 1
	use_power = 2
	update_icon()


// Now it will use TGUI - Destiant1on
/obj/machinery/media/jukebox/ui_act(action, params)
	if(..())
	#ifdef DEBUG
		src << "DEBUG: Nil"
	#endif
		return

	switch(action)
		if("play")
			for(var/datum/track/T in tracks)
				if(T.title == params["current_track"])
					current_track = T
					StartPlaying()
					break

		if("stop")
			StopPlaying()
	return 1

/obj/machinery/media/jukebox/ui_data(mob/user)
	var/list/data = list()

	data["current_track"] = current_track != null ? current_track.title : ""
	data["playing"] = playing

	var/list/tgui_tracks = new
	for(var/datum/track/T in tracks)
		tgui_tracks[++tgui_tracks.len] = list("track" = T.title)

	data["tracks"] = tgui_tracks

	return data

/obj/machinery/media/jukebox/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = 0, datum/tgui/master_ui = null, datum/ui_state/state = default_state) // Remember to use the appropriate state.
	if(stat & (NOPOWER|BROKEN))
		usr << "\The [src] doesn't work."
		return
	ui = SStgui.try_update_ui(user, src, ui_key, ui, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "jukebox", name, 500, 300, master_ui, state)
		ui.open()

