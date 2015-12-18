//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32
datum/track
	var/title
	var/path

datum/track/New(var/title_name, var/audio)
	title = title_name
	path = audio

/obj/machinery/media/jukebox/
	name = "space jukebox"
	icon = 'icons/obj/jukebox.dmi'
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
	var/list/datum/track/tracks = list()

/obj/machinery/media/jukebox/New()
	..()
	update_icon()
	tracks = list(
		new/datum/track("AC/DC - High Way To Hell", "sound/playlist/acdc - high way to hell.ogg"),
		new/datum/track("Benjamin Briggs - Spoiled", "sound/playlist/Benjamin Briggs - Spoiled.ogg"),
		new/datum/track("Dean Martin - Let It Snow", "sound/playlist/Dean Martin - Let It Snow.ogg"),
		new/datum/track("Eminem - Love The Way You Lie (Violin Cover by Eric Stanley)", "sound/playlist/Eminem - Love the way you lie (violin cover by Eric Stanley).ogg"),
		new/datum/track("Gorillaz - Feel Good Inc", "sound/playlist/Gorillaz - Feel Good Inc.ogg"),
		new/datum/track("IAMTHEKIDYOUKNOWWHATIMEAN - Run (Hotline Miami 2 Wrong Number OST)", "sound/playlist/IAMTHEKIDYOUKNOWWHATIMEAN - Run (Hotline Miami 2 Wrong Number OST).ogg"),
		new/datum/track("Imagine Dragons - Radioactive", "sound/playlist/Imagine Dragons - Radioactive.ogg"),
		new/datum/track("James Arthur - Impossible", "sound/playlist/James Arthur - Impossible.ogg"),
		new/datum/track("Johnny Cash - House Of The Rising Sun", "sound/playlist/Johnny Cash - House Of The Rising Sun.ogg"),
		new/datum/track("Kid Cudi - Day n Nite", "sound/playlist/Kid cudi - day n nite.ogg"),
		new/datum/track("Linkin Park - Numb", "sound/playlist/Linkin Park - Numb.ogg"),
		new/datum/track("M.O.O.N. - Hydrogen", "sound/playlist/M.O.O.N. - Hydrogen.ogg"),
		new/datum/track("Nickelback - When We Stand Together", "sound/playlist/Nickelback - When We Stand Together.ogg"),
		new/datum/track("Nirvana - Smells Like A Teen Spirit", "sound/playlist/Nirvana - Smells like a teen spirit.ogg"),
		new/datum/track("Nitro Fun - New Game", "sound/playlist/Nitro Fun - New Game.ogg"),
		new/datum/track("NWA - Fuck The Police", "sound/playlist/NWA - Fuck The Police.ogg"),
		new/datum/track("Paul Stanley - Live To Win", "sound/playlist/Paul Stanley - Live To Win.ogg"),
		new/datum/track("Serbian Soldiers - REMOVE KEBAB (SERBIA STRONG)", "sound/playlist/Serbian Soldiers - REMOVE KEBAB.ogg"),
		new/datum/track("Skrillex ft. Damian Marley - Make It Bun Dem", "sound/playlist/Skrillex ft. Damian Marley - Make It Bun Dem.ogg"),
		new/datum/track("Baystation12 - Intro", "sound/playlist/Space Station 13 - Baystation 12.ogg"),
		new/datum/track("Clown Anthem", "sound/playlist/Space Station 13 - Clown.ogg"),
		new/datum/track("Star Wars - Cantina Band", "sound/playlist/Star Wars - Cantina Band.ogg"),
		new/datum/track("Grigoriy Leps - Ryumka Vodki", "sound/playlist/Grigoriy Leps - Ryumka Vodki.ogg"),
		new/datum/track("Smyslovye Galucinacii - Vechno Molodoy", "sound/playlist/Smyslovye Galucinacii - Vechno Molodoy.ogg"),
	)


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

/obj/machinery/media/jukebox/attack_ai(mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/media/jukebox/attack_hand(var/mob/user as mob)
	interact(user)

/obj/machinery/media/jukebox/attackby(obj/item/W as obj, mob/user as mob)
	src.add_fingerprint(user)

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
	// Always kill the current sound
	for(var/mob/living/M in mobs_in_area(A))
		M << sound(null, channel = 1)

	A.forced_ambience = null
	playing = 0
	use_power = 1
	update_icon()


/obj/machinery/media/jukebox/proc/StartPlaying()
	StopPlaying()
	if(!current_track)
		return

	var/area/A = get_area(src)
	A.forced_ambience = sound(current_track.path, channel = 1, repeat = 1, volume = 50)

	for(var/mob/living/M in mobs_in_area(A))
		if(M.mind)
			A.play_ambience(M)

	playing = 1
	use_power = 2
	update_icon()
