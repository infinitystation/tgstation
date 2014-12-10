













/obj/item/weapon/kick_scooter
	name = "kick_scooter"
	desc = "A large tool for moving... his call kick_scooter!"
	icon = 'icons/obj/items.dmi'
	icon_state = "shovel"
	force = 8.0
	throwforce = 4.0
	item_state = "shovel"
	w_class = 3.0
	m_amt = 50
	origin_tech = "materials=1;engineering=2"
	attack_verb = list("bashed", "bludgeoned", "thrashed", "whacked")










/obj/item/weapon/kick_scooter/attack_self(mob/user)
	var/obj/structure/stool/bed/chair/vehicle/kick_scooter/R = new /obj/structure/stool/bed/chair/vehicle/kick_scooter(user.loc)
	R.add_fingerprint(user)
//	new/obj/structure/stool/bed/chair/vehicle/kick_scooter(src.loc)
	qdel(src)
	return













/obj/structure/stool/bed/chair/vehicle/kick_scooter
	name = "\improper Kick scooter"
	desc = "Tiny scooter for tiny people."
	icon = 'icons/obj/rollerbed.dmi'
	icon_state = "up"
	var/activated = 0 //E.g
	anchored = 0
	density = 0 //Can pass
	var/can_spacemove = 0// Flying scooter? Sure - NO!







/obj/structure/stool/bed/chair/vehicle/kick_scooter/relaymove(mob/user, direction)
	if(user.stat || user.stunned || user.weakened || user.paralysis)
		unbuckle()
	if(istype(src.loc, /turf/space))
		if(!src.Process_Spacemove(0))	return
	else
		if(activated)
			return
		else
			activated = 1
			step(src, direction)
//			update_mob()
			handle_rotation()
			sleep 1.5
			activated = 0

/obj/structure/stool/bed/chair/vehicle/kick_scooter/attack_hand(mob/user as mob)       //attackby(var/obj/item/I, var/mob/user)
	..()
	if(buckled_mob)
		return 0
	new/obj/item/weapon/kick_scooter/(get_turf(src))
	qdel(src)
	return



/obj/structure/stool/bed/Move(atom/newloc, direct) //Some bed children move
	. = ..()
	if(buckled_mob)
		buckled_mob.buckled = null
		if(!buckled_mob.Move(loc, direct))
			loc = buckled_mob.loc //we gotta go back
			last_move = buckled_mob.last_move
			inertia_dir = last_move
			buckled_mob.inertia_dir = last_move
			. = 0
		buckled_mob.buckled = src


/*/obj/structure/stool/bed/chair/vehicle/kick_scooter/update_mob()
	if(buckled_mob)
		buckled_mob.dir = dir
		switch(dir)
			if(SOUTH)
				buckled_mob.pixel_x = 0
				buckled_mob.pixel_y = 7
			if(WEST)
				buckled_mob.pixel_x = 4
				buckled_mob.pixel_y = 7
			if(NORTH)
				buckled_mob.pixel_x = 0
				buckled_mob.pixel_y = 4
			if(EAST)
				buckled_mob.pixel_x = -4
				buckled_mob.pixel_y = 7
				*/




/obj/structure/stool/bed/chair/vehicle/kick_scooter/Move()
	..()
	if(buckled_mob)
		if(buckled_mob.buckled == src)
			buckled_mob.loc = loc

/obj/structure/stool/bed/chair/vehicle/kick_scooter/buckle_mob(mob/M, mob/user)
	if(M != user || !ismob(M) || get_dist(src, user) > 1 || user.restrained() || user.lying || user.stat || M.buckled || istype(user, /mob/living/silicon))
		return

	unbuckle()

	M.visible_message(\
		"<span class='notice'>[M] climbs onto the !</span>",\
		"<span class='notice'>You climb onto the !</span>")
	M.buckled = src
	M.loc = loc
	M.dir = dir
	M.update_canmove()
	buckled_mob = M
//	update_mob()
	add_fingerprint(user)

/obj/structure/stool/bed/chair/vehicle/kick_scooter/unbuckle()
	if(buckled_mob)
		buckled_mob.pixel_x = 0
		buckled_mob.pixel_y = 0
	..()

/obj/structure/stool/bed/chair/vehicle/kick_scooter/handle_rotation()
	if(dir == SOUTH)
		layer = FLY_LAYER
	else
		layer = OBJ_LAYER

	if(buckled_mob)
		if(buckled_mob.loc != loc)
			buckled_mob.buckled = null //Temporary, so Move() succeeds.
			buckled_mob.buckled = src //Restoring

//	update_mob()
.



