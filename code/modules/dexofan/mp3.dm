//Originaly by Riya Makary

/obj/item/clothing/ears/earmuffs/mp3
	name = "Headphones with MP3"
	desc = "It is a black portable wireless stereo head hanging, blue LCD display built-in FM radio Mp3 headset."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "headphones_off"
	item_state = "headphones_off"
	worn_icon = 'icons/mob/infinity_work.dmi'
	up = 0
	actions_types = list(/datum/action/item_action/music)


/obj/item/clothing/ears/earmuffs/mp3/attack_self()
	toggle()


/obj/item/clothing/ears/earmuffs/mp3/verb/toggle()
	set category = "Object"
	set name = "Adjust headphones"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			icon_state = "headphones_off"
			usr << sound(null, channel = 4)
			usr << browse(null, "window=mp3")
			usr << "You turn off [src]"
			update_icon()
		else
			src.up = !src.up
			icon_state = "headphones_on"
			//if (istype(usr.ears, /obj/item/clothing/ears/earmuffs/mp3))
			OpenInterface(usr)
			usr << "You turn on [src]"
		update_icon()	//so our mob-overlays update

/obj/item/clothing/ears/earmuffs/mp3/dropped()
	usr << sound(null, channel = 4)
	usr << browse(null, "window=mp3")

/obj/item/clothing/ears/earmuffs/mp3/proc/OpenInterface(mob/user as mob)

	var/dat = "MP3 player<BR>"

	dat += "Astronaut - Rain	<a href='byond://?src=\ref[src];music1=1'>Play</a><br>"
	dat += "UDO - Cut Me Out	<a href='byond://?src=\ref[src];music2=1'>Play</a><br>"
	dat += "Beastie Boys - Intergalactic	<a href='byond://?src=\ref[src];music3=1'>Play</a><br>"
	dat += "Skyline - Look Forward	<a href='byond://?src=\ref[src];music4=1'>Play</a><br>"

	dat += "Bee Gees - Stayin' Alive	<a href='byond://?src=\ref[src];music5=1'>Play</a><br>"
	dat += "Fever The Ghost - Source	<a href='byond://?src=\ref[src];music6=1'>Play</a><br>"
	dat += "I'm a member of the Midnight Crew	<a href='byond://?src=\ref[src];music7=1'>Play</a><br>"
	dat += "Iron Maiden - Out of The Silent Planet	<a href='byond://?src=\ref[src];music8=1'>Play</a><br>"
	dat += "Iron Savior - 01 The Landing	<a href='byond://?src=\ref[src];music9=1'>Play</a><br>"
	dat += "Justice - D.A.N.C.E.	<a href='byond://?src=\ref[src];music10=1'>Play</a><br>"
	dat += "Malcolm Brown - Do You Remem8er Me	<a href='byond://?src=\ref[src];music11=1'>Play</a><br>"
	dat += "M83 - Midnight City	<a href='byond://?src=\ref[src];music12=1'>Play</a><br>"
	dat += "Mystery Skulls - Magic	<a href='byond://?src=\ref[src];music13=1'>Play</a><br>"
	dat += "Nirvana - Smells like teen spirit	<a href='byond://?src=\ref[src];music14=1'>Play</a><br>"
	dat += "Pixel Piracy - Sailing the World	<a href='byond://?src=\ref[src];music15=1'>Play</a><br>"
	dat += "Rick Astley - Never Gonna Give You Up	<a href='byond://?src=\ref[src];music16=1'>Play</a><br>"
	dat += "EVO - In Space	<a href='byond://?src=\ref[src];music17=1'>Play</a><br>"
	dat += "Starset - Antigravity	<a href='byond://?src=\ref[src];music18=1'>Play</a><br>"
	dat += "U-Free - My New Black Benzo	<a href='byond://?src=\ref[src];music19=1'>Play</a><br>"
	dat += "Wolfgun - Beautiful	<a href='byond://?src=\ref[src];music20=1'>Play</a><br>"

	dat += "Stop Music <a href='byond://?src=\ref[src];music21=1'>Stop</a><br>"

	user << browse(dat, "window=mp3")
	onclose(user, "mp3")
	return


/obj/item/clothing/ears/earmuffs/mp3/Topic(href, href_list)
	//if (istype(usr.ears, /obj/item/clothing/ears/earmuffs/mp3))
	usr << sound(null, channel = 1)
	if(href_list["music1"])
		usr << sound('sound/lobby/title1.ogg',channel=4, volume=100);
	else if(href_list["music2"])
		usr << sound('sound/lobby/title2.ogg',channel=4, volume=100);
	else if(href_list["music3"])
		usr << sound('sound/lobby/title3.ogg',channel=4, volume=100);
	else if(href_list["music4"])
		usr << sound('sound/lobby/title4.ogg',channel=4, volume=100);
	else if(href_list["music5"])
		usr << sound('sound/playlist/bee_jees_stayin_alive.ogg',channel=4, volume=100);
	else if(href_list["music6"])
		usr << sound('sound/playlist/fever_the_ghost_source.ogg',channel=4, volume=100);
	else if(href_list["music7"])
		usr << sound('sound/playlist/im_a_member_of_the_midnight_crew.ogg',channel=4, volume=100);
	else if(href_list["music8"])
		usr << sound('sound/playlist/iron_maiden_out_of_the_silent_planet.ogg',channel=4, volume=100);
	else if(href_list["music9"])
		usr << sound('sound/playlist/iron_savior_the_landing.ogg',channel=4, volume=100);
	else if(href_list["music10"])
		usr << sound('sound/playlist/justice_dance.ogg',channel=4, volume=100);
	else if(href_list["music11"])
		usr << sound('sound/playlist/malcolm_brown_do_you_remember_me.ogg',channel=4, volume=100);
	else if(href_list["music12"])
		usr << sound('sound/playlist/m83_midnight.ogg',channel=4, volume=100);
	else if(href_list["music13"])
		usr << sound('sound/playlist/mystery_skulls_magic.ogg',channel=4, volume=100);
	else if(href_list["music14"])
		usr << sound('sound/playlist/nirvana_smells_like_teen_spirit.ogg',channel=4, volume=100);
	else if(href_list["music15"])
		usr << sound('sound/playlist/pixel_piracy_sailing_the_world.ogg',channel=4, volume=100);
	else if(href_list["music16"])
		usr << sound('sound/playlist/rick_astley_nggup.ogg',channel=4, volume=100);
	else if(href_list["music17"])
		usr << sound('sound/playlist/evo_v_kosmos.ogg',channel=4, volume=100);
	else if(href_list["music18"])
		usr << sound('sound/playlist/starset_antigravity.ogg',channel=4, volume=100);
	else if(href_list["music19"])
		usr << sound('sound/playlist/ufree_my_new_black_benzo.ogg',channel=4, volume=100);
	else if(href_list["music20"])
		usr << sound('sound/playlist/wolfgun_beautiful.ogg',channel=4, volume=100);
	else if(href_list["music21"])
		usr << sound(null, channel = 4)

	updateUsrDialog()
