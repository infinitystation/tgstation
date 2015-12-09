/obj/effect/blob/shield
	name = "strong blob"
	icon = 'icons/mob/blob.dmi'
	icon_state = "blob_idle"
	desc = "A solid wall of slightly twitching tendrils."
	health = 150
	maxhealth = 150
	explosion_block = 3
	fire_resist = 5
	point_return = 2


/obj/effect/blob/shield/New()
	..()
	air_update_turf(1)

/obj/effect/blob/shield/Destroy()
	var/turf/T = get_turf(src)
	spawn(1)
		T.air_update_turf(1)
	..()

/obj/effect/blob/shield/CanPass(atom/movable/mover, turf/target, height=0)
	if(istype(mover) && mover.checkpass(PASSBLOB))	return 1
	return 0
