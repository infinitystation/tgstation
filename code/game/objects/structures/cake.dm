/obj/structure/cake
	name = "Infinity cake"
	desc = "None"
	icon = 'icons/obj/cake.dmi'
	icon_state = "cake"
	density = 1
	anchored = 1

/obj/structure/cake/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/candle))
		update_icon()

/obj/structure/cake/update_icon()
	icon_state = "cake_candles"
