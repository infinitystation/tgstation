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
		new/datum/track("Bioshock Infinite OST - After You ve Gone (Ruth Etting)", 'sound/playlist/Bioshock Infinite OST - After You ve Gone (Ruth Etting).ogg'),
		new/datum/track("Bob Crosby - Dear Hearts And Gentle People", 'sound/playlist/Bob Crosby - Dear Hearts And Gentle People.ogg'),
		new/datum/track("Bobby Darin - Beyond The Sea", 'sound/playlist/Bobby Darin - Beyond The Sea.ogg'),
		new/datum/track("Chubby Checker - Let s Twist Again", 'sound/playlist/Chubby Checker - Let s Twist Again.ogg'),
		new/datum/track("Chuck Berry - Johnny B. Goode", 'sound/playlist/Chuck Berry - Johnny B. Goode.ogg'),
		new/datum/track("Dan Martinez - Lead Me Home (featuring Eddie Wakes)", 'sound/playlist/Dan Martinez - Lead Me Home (featuring Eddie Wakes).ogg'),
		new/datum/track("Electro Light feat. Sidekicks - Hold On To Me", 'sound/playlist/Electro Light feat. Sidekicks - Hold On To Me.ogg'),
		new/datum/track("Elvis Presley - I can t help falling in love with You", 'sound/playlist/Elvis Presley - I can t help falling in love with You.ogg'),
		new/datum/track("Elvis Presley - Rock n roll", 'sound/playlist/Elvis Presley - Rock n roll.ogg'),
		new/datum/track("Elvis Presley - Tutti Frutti", 'sound/playlist/Elvis Presley - Tutti Frutti.ogg'),
		new/datum/track("Frank Sinatra - Blue Moon", 'sound/playlist/Frank Sinatra - Blue Moon.ogg'),
		new/datum/track("Frank Sinatra - I ve Got You Under My Skin", 'sound/playlist/Frank Sinatra - I ve Got You Under My Skin.ogg'),
		new/datum/track("Jim Yosef - Arrow", 'sound/playlist/Jim Yosef - Arrow.ogg'),
		new/datum/track("Johnie Cash - The Man Comes Around", 'sound/playlist/Johnie Cash - The Man Comes Around.ogg'),
		new/datum/track("Johnny Cash - Hurt", 'sound/playlist/Johnny Cash - Hurt.ogg'),
		new/datum/track("Johny Cash - God s Gonna Cut You Down", 'sound/playlist/Johny Cash - God s Gonna Cut You Down.ogg'),
		new/datum/track("Lynda Carter - Good Neighbor", 'sound/playlist/Lynda Carter - Good Neighbor.ogg'),
		new/datum/track("Mafia 2 OST - After The Lights Go Down Low", 'sound/playlist/Mafia 2 OST - After The Lights Go Down Low.ogg'),
		new/datum/track("Marty Robbins - Big Iron", 'sound/playlist/Marty Robbins - Big Iron.ogg'),
		new/datum/track("Tennessee Ernie Ford - 16 tonns", 'sound/playlist/Tennessee Ernie Ford - 16 tonns.ogg'),
		new/datum/track("The Five Stars - Atom Bomb Baby", 'sound/playlist/The Five Stars - Atom Bomb Baby.ogg'),
		new/datum/track("The Ink Spots - I Don t Want To Set The World On Fire", 'sound/playlist/The Ink Spots - I Don t Want To Set The World On Fire.ogg'),
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

/obj/machinery/media/jukebox/attack_hand(var/mob/user as mob)
	if(stat & (NOPOWER|BROKEN))
		usr << "\The [src] doesn't appear to function."
		return

	var/title = "RetroBox - Space Style"
	var/dat = ""

	dat += "<b>Playing - [current_track ? current_track.title : "Nothing"]<b>"
	dat += "<br/><a href='?src=\ref[src];play=1'>Play</a> <a href='?src=\ref[src];stop=1'>Stop</a><br/>"

	for(var/datum/track/T in tracks)
		dat += "<br/><a href='?src=\ref[src];change_track=[T.title]'>[T.title]</a>"

	user.set_machine(src)
	var/datum/browser/popup = new(user, "jukebox", title, 470, 500)
	popup.set_content(dat)
	popup.set_title_image(user.browse_rsc_icon(src.icon, src.icon_state))
	popup.open(1)
	return

	return 0

/obj/machinery/media/jukebox/Topic(href, href_list)
	if(..())
		return

	if(!anchored)
		usr << "<span class='warning'>You must secure \the [src] first.</span>"
		return

	if(stat & (NOPOWER|BROKEN))
		usr << "\The [src] doesn't appear to function."
		return

	if(href_list["stop"])
		StopPlaying()

	if(href_list["play"])
		if(current_track == null)
			usr << "No track selected."
		else
			StartPlaying()

	if(href_list["change_track"])
		for(var/datum/track/T in tracks)
			if(T.title == href_list["change_track"])
				current_track = T
				StartPlaying()

	src.updateUsrDialog()
	return 1

/obj/machinery/media/jukebox/attack_ai(mob/user as mob)
	return src.attack_hand(user)

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
