/obj/mecha/medical/Initialize()
	. = ..()
	trackers += new /obj/item/mecha_parts/mecha_tracking(src)
