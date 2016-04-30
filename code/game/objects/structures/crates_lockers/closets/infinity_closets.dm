/obj/structure/closet/plastic
	name = "beach closet"
	desc = "Big closet, made of plastic."
	icon_state = "plastic"
	icon = 'icons/obj/infinity_object.dmi'

/obj/structure/closet/plastic/New()
	..()
	new /obj/item/rolled_towel(src)
	new /obj/item/rolled_towel/black(src)
	new /obj/item/rolled_towel/blue_stripped(src)
	new /obj/item/rolled_towel/red_stripped(src)
	new /obj/item/rolled_towel/green_stripped(src)
	new /obj/item/rolled_towel/yellow_stripped(src)
	new /obj/item/rolled_towel/pink_stripped(src)
	new /obj/item/rolled_towel/ilove(src)

/obj/structure/closet/wood
	name = "wood closet"
	desc = "Closet made of wood."
	icon_state = "wooden"
	icon = 'icons/obj/infinity_object.dmi'