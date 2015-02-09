/obj/item/pipe_gsensor
	name = "sensor"
	desc = "A gas sensor"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "gsensor0"
	item_state = "gsensor0"
	// for sensor setting
	var/id_tag = null
	var/freq = 1441
	w_class = 4

/obj/item/pipe_gsensor/attackby(var/obj/item/weapon/W as obj, var/mob/user as mob)
	..()
	if (istype(W, /obj/item/device/multitool))
		interact(user)
		return ..()

	if (!istype(W, /obj/item/weapon/wrench))
		return ..()

	var/obj/machinery/air_sensor/V = new/obj/machinery/air_sensor(src.loc)
	V.name = name
	if(id_tag)
		V.id_tag = id_tag
	V.frequency = freq
	V.set_frequency(freq)

	playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
	user << "<span class='notice'>You have fastened sensor.</span>"
	qdel(src)

// pipe-device interaction
/obj/item/pipe_gsensor/interact(mob/user)
	src.add_fingerprint(user)
	var/dat = {"
<A href='?src=\ref[src];set-tag=0'>ID-Tag:</A> [id_tag]<BR>
<A href='?src=\ref[src];set-freq=0'>Frequency:</A> [freq]<BR>
"}
	user.set_machine(src)
	var/datum/browser/popup = new(user, "settings", "Sensor Setting")
	popup.set_content(dat)
	popup.open(1)


/obj/item/pipe_gsensor/Topic(href, href_list)
	if(!ishuman(usr))	return
	var/mob/living/carbon/human/user = usr
	user.set_machine(src)

	if(href_list["set-name"])
		name = stripped_input(usr, "ИмЯ?")
		interact(user)

	if(href_list["set-tag"])
		id_tag = stripped_input(usr, "ID-тэг?")
		interact(user)

	if(href_list["set-freq"])
		freq = stripped_input(usr, "Частота? От 1439 до 1441")
		freq = text2num(freq)
		while((freq > 1441) && (freq < 1439))
			freq = stripped_input(usr, "Частота? От 1439 до 1441")
		freq = text2num(freq)
		interact(user)