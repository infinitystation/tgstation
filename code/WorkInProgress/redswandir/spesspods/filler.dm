/obj/structure/spacepod
	name = "\improper space pod"
	desc = "A space pod meant for space travel. It's just a model."
	icon = 'icons/mecha/pods.dmi'
	density = 1 //Dense. To raise the heat.
	opacity = 0
	anchored = 1
	unacidable = 1
	layer = 3.9
	infra_luminosity = 15

/obj/structure/spacepod/New()
	. = ..()
	bound_width = 64
	bound_height = 64