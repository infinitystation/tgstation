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
		new/datum/track("Bee Gees - Stayin' Alive", 'sound/playlist/bee_jees_stayin_alive.ogg'),
		new/datum/track("Fever The Ghost - Source", 'sound/playlist/fever_the_ghost_source.ogg'),
		new/datum/track("I'm a member of the Midnight Crew", 'sound/playlist/im_a_member_of_the_midnight_crew.ogg'),
		new/datum/track("Iron Maiden - Out of The Silent Planet", 'sound/playlist/iron_maiden_out_of_the_silent_planet.ogg'),
		new/datum/track("Iron Savior - 01 The Landing", 'sound/playlist/iron_savior_the_landing.ogg'),
		new/datum/track("Justice - D.A.N.C.E.", 'sound/playlist/justice_dance.ogg'),
		new/datum/track("Malcolm Brown - Do You Remem8er Me", 'sound/playlist/malcolm_brown_do_you_remember_me.ogg'),
		new/datum/track("M83 - Midnight City", 'sound/playlist/m83_midnight.ogg'),
		new/datum/track("Mystery Skulls - Magic", 'sound/playlist/mystery_skulls_magic.ogg'),
		new/datum/track("Nirvana - Smells like teen spirit", 'sound/playlist/nirvana_smells_like_teen_spirit.ogg'),
		new/datum/track("Pixel Piracy - Sailing the World", 'sound/playlist/pixel_piracy_sailing_the_world.ogg'),
		new/datum/track("Rick Astley - Never Gonna Give You Up", 'sound/playlist/rick_astley_nggup.ogg'),
		new/datum/track("EVO - In Space", 'sound/playlist/evo_v_kosmos.ogg'),
		new/datum/track("Starset - Antigravity", 'sound/playlist/starset_antigravity.ogg'),
		new/datum/track("U-Free - My New Black Benzo", 'sound/playlist/ufree_my_new_black_benzo.ogg'),
		new/datum/track("Wolfgun - Beautiful", 'sound/playlist/wolfgun_beautiful.ogg')
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

