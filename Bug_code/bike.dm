/obj/item/key/segway
	name = "\improper Segway-Kart key"
	desc = "A keyring with serway"
	icon_state = "segway"

/obj/structure/stool/bed/chair/vehicle/segway
	name = "\improper Segway-Kart"
	desc = "Tiny car for tiny people."
	icon_state = "segway"
	//nick = "TRUE POWER"
	var/fuel = 0
	var/activated = 0


/obj/structure/stool/bed/chair/vehicle/segway/process()
	if(activated)
		icon_state = "segway"
		if(!buckled_mob)
			activated = 0
			icon_state = "segway"
	if(fuel < 0)
		fuel = 0



/obj/structure/stool/bed/chair/vehicle/segway/New()
	. = ..()
	fuel = 0
	create_reagents(500)
	reagents.add_reagent("fuel", 0)
	processing_objects |= src
	handle_rotation()

/obj/structure/stool/bed/chair/vehicle/segway/buckle_mob(mob/M, mob/user)
	..(M,user)
	update_icon()

/obj/structure/stool/bed/chair/vehicle/segway/unbuckle()
	..()
	update_icon()


/obj/structure/stool/bed/chair/vehicle/segway/update_icon()
	icon_state="segway" //[!isnull(buckled_mob)]



/obj/structure/stool/bed/chair/vehicle/segway/update_mob()
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

/obj/structure/stool/bed/chair/vehicle/segway/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/weapon/reagent_containers/food))
		user.visible_message("\blue [user] puts the [W.name] in the [src].", "\blue You put the [W.name] in the [src].")
		reagents.add_reagent("fuel", 75)
		del(W)

/obj/structure/stool/bed/chair/vehicle/segway/examine(mob/user)
	if(reagents.total_volume <= 0) //no fuel
		if(user)
			user << "\red \the [src] has no fuel!"
		return

/obj/structure/stool/bed/chair/vehicle/segway/attackby(mob/user)
	if(reagents.get_reagent_amount("fuel") <= 5)
		if(activated)
			src.visible_message("\red The [nick] lets out a last honk before running out of fuel.")
			reagents.remove_reagent("fuel", 5)
		else
			user << "\red The [src.name] doesn't have enough fuel!"
	else
		spawn(5)
			activated = 1
			src.visible_message("\blue The [nick] start up segway.")


