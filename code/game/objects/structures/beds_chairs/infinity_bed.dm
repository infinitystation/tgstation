/obj/structure/bed/psych
	name = "psych bed"
	desc = "For prime comfort during psychiatric evaluations."
	icon_state = "psychbed"
	icon = 'icons/obj/infinity_object.dmi'

/obj/structure/bed/double
	name = "Double bed"
	desc = "The best bed in deep space!"
	icon_state = "double"
	icon = 'icons/obj/infinity_object.dmi'

/obj/structure/bed/double/right
	name = "Double bed"
	desc = "The best bed in deep space!"
	icon_state = "double1"

/obj/structure/bed/double/left
	name = "Double bed"
	desc = "The best bed in deep space!"
	icon_state = "double2"

/obj/item/rolled_towel
	name = "rolled beach towel"
	desc = "Collapsed big towel. Using on the beach."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "rolled_towel"
	w_class = 2
	var/beach_towel = /obj/structure/towel

/obj/item/rolled_towel/attack_self(mob/user)
	var/obj/item/rolled_towel/R = new beach_towel(user.loc)
	R.add_fingerprint(user)
	qdel(src)

/obj/structure/towel
	name = "beach towel"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "beach_towel"
	anchored = 0
	var/rolled_towel = /obj/item/rolled_towel

/obj/structure/towel/MouseDrop(over_object, src_location, over_location)
	..()
	if(over_object == usr && Adjacent(usr) && (in_range(src, usr) || usr.contents.Find(src)))
		if(!ishuman(usr))
			return 0
		visible_message("<span class='notice'>[usr] rolled up [src].</span>")
		var/obj/item/rolled_towel/B = new rolled_towel(get_turf(src))
		usr.put_in_hands(B)
		qdel(src)

/obj/item/rolled_towel/black
	name = "black rolled towel"
	icon_state = "black_rolled_towel"
	beach_towel = /obj/structure/towel/black

/obj/structure/towel/black
	name = "black beach towel"
	icon_state = "black_beach_towel"
	rolled_towel = /obj/item/rolled_towel/black

/obj/item/rolled_towel/blue_stripped
	name = "blue rolled towel"
	icon_state = "bluestripp_towel"
	beach_towel = /obj/structure/towel/blue_stripped

/obj/structure/towel/blue_stripped
	name = "blue beach towel"
	icon_state = "bluestripp_beach"
	rolled_towel = /obj/item/rolled_towel/blue_stripped

/obj/item/rolled_towel/red_stripped
	name = "red rolled towel"
	icon_state = "redstripp_towel"
	beach_towel = /obj/structure/towel/red_stripped

/obj/structure/towel/red_stripped
	name = "red beach towel"
	icon_state = "redstripp_beach"
	rolled_towel = /obj/item/rolled_towel/red_stripped

/obj/item/rolled_towel/green_stripped
	name = "green rolled towel"
	icon_state = "greenstripp_towel"
	beach_towel = /obj/structure/towel/green_stripped

/obj/structure/towel/green_stripped
	name = "green beach towel"
	icon_state = "greenstripp_beach"
	rolled_towel = /obj/item/rolled_towel/green_stripped

/obj/item/rolled_towel/yellow_stripped
	name = "yellow rolled towel"
	icon_state = "yellowstripp_towel"
	beach_towel = /obj/structure/towel/yellow_stripped

/obj/structure/towel/yellow_stripped
	name = "green beach towel"
	icon_state = "yellowstripp_beach"
	rolled_towel = /obj/item/rolled_towel/yellow_stripped

/obj/item/rolled_towel/pink_stripped
	name = "pink rolled towel"
	icon_state = "pinkstripp_towel"
	beach_towel = /obj/structure/towel/pink_stripped

/obj/structure/towel/pink_stripped
	name = "green beach towel"
	icon_state = "pinkstripp_beach"
	rolled_towel = /obj/item/rolled_towel/pink_stripped

/obj/item/rolled_towel/ilove
	name = "*i <3 you* rolled towel"
	icon_state = "rolled_towel"
	beach_towel = /obj/structure/towel/ilove

/obj/structure/towel/ilove
	name = "*i <3 you* beach towel"
	icon_state = "ilove_beach"
	rolled_towel = /obj/item/rolled_towel/ilove

/obj/structure/chair/sunbed
	name = "sunbed"
	desc = "It's so nice, just to lie on this chair, and relax."
	icon_state = "sunbed"
	icon = 'icons/obj/infinity_object.dmi'
	item_chair = 0

/obj/structure/chair/stool/wood
	icon_state = "wooden_stool"
	icon = 'icons/obj/infinity_object.dmi'
	item_chair = /obj/item/chair/stool/wood

/obj/item/chair/stool/wood
	icon_state = "wooden_stool_toppled"
	icon = 'icons/obj/infinity_object.dmi'
	origin_type = /obj/structure/chair/stool/wood

/obj/structure/chair/new_chair
	name = "chair"
	icon_state = "new_chair"
	icon = 'icons/obj/infinity_object.dmi'
	item_chair = /obj/item/chair/stool/new_chair

/obj/item/chair/stool/new_chair
	name = "chair"
	icon_state = "new_chair_toppled"
	icon = 'icons/obj/infinity_object.dmi'
	origin_type = /obj/structure/chair/new_chair

/obj/structure/chair/stool/oneleg
	icon_state = "oneleg_stool"
	icon = 'icons/obj/infinity_object.dmi'
	item_chair = /obj/item/chair/stool/oneleg

/obj/item/chair/stool/oneleg
	icon_state = "oneleg_stool_toppled"
	icon = 'icons/obj/infinity_object.dmi'
	origin_type = /obj/structure/chair/stool/oneleg

/obj/structure/chair/comfy/sofa/bench
	name = "bench"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "sofa"

/obj/structure/chair/comfy/sofa/bench/right
	name = "bench"
	icon_state = "sofa_right"

/obj/structure/chair/comfy/sofa/bench/centre
	name = "bench"
	icon_state = "sofa_centre"