/obj/machinery/computer/holo
	name = "holocomputer"
	icon = 'icons/obj/computer_holo.dmi'
	icon_state = "computer"
	desc = "A pinnacle in NanoTrasen computer industry. These consoles are a lot less fragile and more robust but needs more power."
	density = 1
	anchored = 1
	use_power = 1
	idle_power_usage = 400
	active_power_usage = 400
	processing = 0
	brightness_on = 5
	var/icon_screen_contents = "generic"
	icon_screen = "screen_generic"

// override for use with holoconsole
/obj/machinery/computer/holo/update_icon()
	overlays.Cut()
	if(stat & NOPOWER)
		overlays -= icon_screen_contents
		overlays -= icon_screen
		overlays += "[icon_state]_off"
		return
	overlays += icon_keyboard
	if(stat & BROKEN)
		overlays -= icon_screen_contents
		overlays -= icon_screen
		overlays += "[icon_state]_broken"
	else
		overlays += icon_screen
		overlays += icon_screen_contents

/obj/machinery/computer/holo/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/screwdriver) && circuit && !(flags&NODECONSTRUCT))
		playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
		user << "<span class='notice'> You start to disconnect the hololens...</span>"
		if(do_after(user, 20/I.toolspeed, target = src))
			var/obj/structure/computerframe/holoframe/A = new /obj/structure/computerframe/holoframe( src.loc )
			A.circuit = circuit
			A.anchored = 1
			circuit = null
			for (var/obj/C in src)
				C.loc = src.loc
			if (src.stat & BROKEN)
				user << "<span class='notice'>The broken glass falls out.</span>"
				new /obj/item/weapon/shard( src.loc )
				A.state = 3
				A.icon_state = "holo_3"
			else
				user << "<span class='notice'>You disconnect the hololens.</span>"
				A.state = 4
				A.icon_state = "holo_4"
			qdel(src)
	return