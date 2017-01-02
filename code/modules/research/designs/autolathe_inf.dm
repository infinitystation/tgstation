/*
	/datum/design/mop
	name = "Mop"
	id = "mop"
	build_type = AUTOLATHE
	materials = list(MAT_METAL = 200)
	build_path = /obj/item/weapon/mop
	category = list("initial", "Misc")
*/
/*	Status Display	*/
/datum/design/status_display
	name = "Status display frame"
	id = "status_display"
	build_type = AUTOLATHE
	materials = list(MAT_METAL = 14000, MAT_GLASS = 8000)
	build_path = /obj/item/wallframe/status_display
	category = list("initial", "Construction")

/obj/item/wallframe/status_display
	name = "status display frame"
	desc = "The status display form for build it on wall."
	icon = 'icons/obj/status_display.dmi'
	icon_state = "frame"
	result_path = /obj/machinery/status_display

/obj/machinery/status_display/attackby(obj/item/I, mob/living/user, params) //Пусть это пока что побудет тут, больше некуда сунуть.- Quardbreak(c)
	if(istype(I, /obj/item/weapon/wrench))
		user << "<span class='notice'>You start [anchored ? "un" : ""]securing [name]...</span>"
		playsound(loc, I.usesound, 50, 1)
		if(do_after(user, 60*I.toolspeed, target = src))
			playsound(loc, 'sound/items/Deconstruct.ogg', 50, 1)
			user << "<span class='notice'>You [anchored ? "un" : ""]secure [name].</span>"
			new /obj/item/wallframe/status_display(loc)
			qdel(src)
		return ..()

/*	Mirror */
/datum/design/mirror
	name = "Mirror frame"
	id = "mirror"
	build_type = AUTOLATHE
	materials = list(MAT_GLASS = 3000)
	build_path = /obj/item/wallframe/mirror
	category = list("initial", "Construction")

/obj/item/wallframe/mirror
	name = "mirror frame"
	desc = "Let's make a museum of crooked mirrors!"
	icon = 'icons/obj/watercloset.dmi'
	icon_state = "mirror"
	result_path = /obj/structure/mirror