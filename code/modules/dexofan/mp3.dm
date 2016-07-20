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

	dat += "Space Oddity        <a href='byond://?src=\ref[src];music1=1'>Play</a><br>"
	dat += "Space Asshole      <a href='byond://?src=\ref[src];music2=1'>Play</a><br>"
	dat += "Undertale      <a href='byond://?src=\ref[src];music3=1'>Play</a><br>"
	dat += "Magic Fly         <a href='byond://?src=\ref[src];music4=1'>Play</a><br>"
	dat += "Frank Sinatra - Blue Moon       <a href='byond://?src=\ref[src];music5=1'>Play</a><br>"
	dat += "Dvar Hishmaliin		<a href='byond://?src=\ref[src];music6=1'>Play</a><br>"
	dat += "Gay Bar		<a href='byond://?src=\ref[src];music7=1'>Play</a><br>"
	dat += "Staying Alive		<a href='byond://?src=\ref[src];music8=1'>Play</a><br>"
	dat += "Johnny Cash - Hurt		<a href='byond://?src=\ref[src];music9=1'>Play</a><br>"

	dat += "Stop Music <a href='byond://?src=\ref[src];music10=1'>Stop</a><br>"

	user << browse(dat, "window=mp3")
	onclose(user, "mp3")
	return


/obj/item/clothing/ears/earmuffs/mp3/Topic(href, href_list)
	//if (istype(usr.ears, /obj/item/clothing/ears/earmuffs/mp3))
	usr << sound(null, channel = 1)
	if(href_list["music1"])
		usr << sound('sound/music/space_oddity.ogg',channel=4, volume=100);
	else if(href_list["music2"])
		usr << sound('sound/music/space_asshole.ogg',channel=4, volume=100);
	else if(href_list["music3"])
		usr << sound('sound/music/undertale.ogg',channel=4, volume=100);
	else if(href_list["music4"])
		usr << sound('sound/music/magic_fly.ogg',channel=4, volume=100);
	else if(href_list["music5"])
		usr << sound('sound/playlist/Frank Sinatra - Blue Moon.ogg',channel=4, volume=100);
	else if(href_list["music6"])
		usr << sound('sound/music/dvar_hishmaliin.ogg',channel=4, volume=100);
	else if(href_list["music7"])
		usr << sound('sound/music/gay_bar.ogg',channel=4, volume=100);
	else if(href_list["music8"])
		usr << sound('sound/music/staying_alive.ogg',channel=4, volume=100);
	else if(href_list["music9"])
		usr << sound('sound/playlist/Johnny Cash - Hurt.ogg',channel=4, volume=100);
	else if(href_list["music10"])
		usr << sound(null, channel = 4)


	updateUsrDialog()
