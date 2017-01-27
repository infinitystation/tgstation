/obj/structure/goonladder
	name = "ladder"
	desc = "A series of parallel bars designed to allow for controlled change of elevation.  You know, by climbing it.  You climb it."
	icon = 'icons/obj/infinity_dexofan.dmi'
	icon_state = "ladder"
	anchored = 1
	density = 0
	var/id = null

/obj/structure/goonladder/New()
	..()
	if(!id)
		id = "generic"
		src.tag = "ladder_[id][src.icon_state == "ladder" ? 0 : 1]"

/obj/structure/goonladder/attack_hand(mob/user as mob)
	if(user.stat || user.weakened || get_dist(user, src) > 1)
		return

	var/obj/structure/goonladder/otherLadder = locate("ladder_[id][src.icon_state == "ladder"]")
	if(!istype(otherLadder))
		return

	user << "You climb [src.icon_state == "ladder" ? "down" : "up"] the ladder."
	user.loc = get_turf(otherLadder)