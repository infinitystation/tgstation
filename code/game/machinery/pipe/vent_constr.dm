//for vent setting
var/setted = 0
var/work_direction = 1
var/id_tag = null
var/freq = 1439

//vent interaction
if ((istype(W, /obj/item/device/multitool)) && (pipe_type == PIPE_UVENT))
	if(setted)
		setted = 0
		user << "<span class='danger'>You cancelled settings</span>"
		return ..()
	else
		interact(user)
		return ..()

//vent init
var/obj/machinery/atmospherics/components/unary/vent_pump/V = new( src.loc )
if(setted)
	if(id_tag)
		V.id_tag = id_tag
	V.frequency = freq
	V.set_frequency(freq)
	V.internal_pressure_bound = 0
	V.external_pressure_bound = 0
	V.pump_direction = work_direction
	V.construction(dir, pipe_dir, pipe_type, color)

// pipe-device interaction
/obj/item/pipe/interact(mob/user)
	src.add_fingerprint(user)
	setted = 1
	var/dat = {"
<A href='?src=\ref[src];set-dir=0'>Mode:</A> [work_direction ? "Vent" : "Syphon"]<BR>
<A href='?src=\ref[src];set-tag=0'>ID-Tag:</A> [id_tag]<BR>
<A href='?src=\ref[src];set-freq=0'>Frequency:</A> [freq]<BR>
"}
	user.set_machine(src)
	var/datum/browser/popup = new(user, "settings", "Vent Setting")
	popup.set_content(dat)
	popup.open(1)


/obj/item/pipe/Topic(href, href_list)
	if(!ishuman(usr))	return
	var/mob/living/carbon/human/user = usr
	user.set_machine(src)

	if(href_list["set-dir"])
		if(work_direction == 1)
			work_direction = 0
		else if (work_direction == 0)
			work_direction = 1
		interact(user)

	if(href_list["set-tag"])
		id_tag = stripped_input(usr, "ID-тэг?")
		interact(user)

	if(href_list["set-freq"])
		freq = stripped_input(usr, "Частота? От 1439 до 1441")
		freq = text2num(freq)
		interact(user)
