//Ported from ParadiseSS13
/mob/living/simple_animal/pet/dog/corgi/Ian/borgi
	name = "E-N"
	real_name = "E-N"	//Intended to hold the name without altering it.
	desc = "It's a borgi."
	icon = 'icons/mob/infinity_mob.dmi'
	icon_state = "borgi"
	icon_living = "borgi"
	var/emagged = 0
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	loot = list(/obj/effect/decal/remains/robot)
	del_on_death = 1
	deathmessage = "blows apart!"
	var/datum/effect_system/spark_spread/spark_system

/mob/living/simple_animal/pet/dog/corgi/Ian/borgi/New(loc)
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(5, 0, src)
	s.attach(src)
	..()

/mob/living/simple_animal/pet/dog/corgi/Ian/borgi/emag_act(user as mob)
	if(!emagged)
		emagged = 1
		visible_message("<span class='warning'>[user] swipes a card through [src].</span>", "<span class='notice'>You overload [src]s internal reactor.</span>")
		spawn (1000)
			src.explode()

/mob/living/simple_animal/pet/dog/corgi/Ian/borgi/proc/explode()
	for(var/mob/M in viewers(src, null))
		if(M.client)
			M.show_message("\red [src] makes an odd whining noise.")
	sleep(10)
	explosion(get_turf(src), 0, 1, 4, 7)
	death()

/mob/living/simple_animal/pet/dog/corgi/Ian/borgi/proc/shootAt(var/atom/movable/target)
	var/turf/T = get_turf(src)
	var/turf/U = get_turf(target)
	if(!T || !U)
		return
	var/obj/item/projectile/beam/A = new /obj/item/projectile/beam(loc)
	A.icon = 'icons/effects/genetics.dmi'
	A.icon_state = "eyelasers"
	playsound(src.loc, 'sound/weapons/taser2.ogg', 75, 1)
	A.current = T
	A.yo = U.y - T.y
	A.xo = U.x - T.x
	A.fire()
	return

/mob/living/simple_animal/pet/dog/corgi/Ian/borgi/Life()
	if(emagged && prob(25))
		var/mob/living/carbon/target = locate() in view(10,src)
		if(target)
			shootAt(target)

	//spark for no reason
	if(prob(5))
		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(5, 0, src)
		s.start()
	..()

/mob/living/simple_animal/pet/dog/corgi/Ian/borgi/death(gibbed)
	if(!gibbed)
		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(5, 0, src)
		s.start()
		..()

/*	TODO: Сделать код сборки Йе-На. ~Quardbreak

	/obj/item/borgi_suit
	name = "borgi endoskeleton"
	desc = "Let's build him!"
	icon =  'icons/mob/infinity_mob.dmi'
	icon_state = "borgi_suit"
	var/obj/item/bodypart/l_arm/borgi/l_arm = null
	var/obj/item/bodypart/r_arm/borgi/r_arm = null
	var/obj/item/bodypart/l_leg/borgi/l_leg = null
	var/obj/item/bodypart/r_leg/borgi/r_leg = null
	var/obj/item/bodypart/chest/borgi/chest = null
	var/obj/item/bodypart/head/borgi/head = null

/obj/item/borgi_suit/New()
	..()
	src.updateicon()

/obj/item/borgi_suit/proc/updateicon()
	src.cut_overlays()
	if(src.l_arm)
		src.add_overlay("l_arm+o")
	if(src.r_arm)
		src.add_overlay("r_arm+o")
	if(src.chest)
		src.add_overlay("chest+o")
	if(src.l_leg)
		src.add_overlay("l_leg+o")
	if(src.r_leg)
		src.add_overlay("r_leg+o")
	if(src.head)
		src.add_overlay("head+o")

/obj/item/borgi_suit/proc/check_completion()
	if(src.l_arm && src.r_arm)
		if(src.l_leg && src.r_leg)
			if(src.chest && src.head)
				feedback_inc("borgi_frames_built",1)
				return 1
	return 0

/obj/item/borgi_suit/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/bodypart/l_leg/borgi))
		if(src.l_leg)
			return
		if(!user.unEquip(W))
			return
		W.forceMove(src)
		W.icon_state = initial(W.icon_state)
		W.cut_overlays()
		src.l_leg = W
		src.updateicon()

	else if(istype(W, /obj/item/bodypart/r_leg/borgi))
		if(src.r_leg)
			return
		if(!user.unEquip(W))
			return
		W.forceMove(src)
		W.icon_state = initial(W.icon_state)
		W.cut_overlays()
		src.r_leg = W
		src.updateicon()

	else if(istype(W, /obj/item/bodypart/l_arm/borgi))
		if(src.l_arm)
			return
		if(!user.unEquip(W))
			return
		W.forceMove(src)
		W.icon_state = initial(W.icon_state)
		W.cut_overlays()
		src.l_arm = W
		src.updateicon()

	else if(istype(W, /obj/item/bodypart/r_arm/borgi))
		if(src.r_arm)
			return
		if(!user.unEquip(W))
			return
		W.forceMove(src)
		W.icon_state = initial(W.icon_state)//in case it is a dismembered robotic limb
		W.cut_overlays()
		src.r_arm = W
		src.updateicon()

	else if(istype(W, /obj/item/bodypart/chest/borgi))
		var/obj/item/bodypart/chest/borgi/CH = W
		if(src.chest)
			return
		if(CH.wired && CH.cell)
			if(!user.unEquip(CH))
				return
			CH.forceMove(src)
			CH.icon_state = initial(CH.icon_state) //in case it is a dismembered robotic limb
			CH.cut_overlays()
			src.chest = CH
			src.updateicon()
		else if(!CH.wired)
			user << "<span class='warning'>You need to attach wires to it first!</span>"
		else
			user << "<span class='warning'>You need to attach a cell to it first!</span>"

	else if(istype(W, /obj/item/bodypart/head/borgi))
		var/obj/item/bodypart/head/borgi/HD = W
		for(var/X in HD.contents)
			if(istype(X, /obj/item/organ))
				user << "<span class='warning'>There are organs inside [HD]!</span>"
				return
		if(src.head)
			return
		if(HD.flash2 && HD.flash1)
			if(!user.unEquip(HD))
				return
			HD.loc = src
			HD.icon_state = initial(HD.icon_state)//in case it is a dismembered robotic limb
			HD.cut_overlays()
			src.head = HD
			src.updateicon()
		else
			user << "<span class='warning'>You need to attach a flash to it first!</span>"

			/mob/living/simple_animal/pet/dog/corgi/Ian/borgi/O = new /mob/living/simple_animal/pet/dog/corgi/Ian/borgi(get_turf(loc))
			if(!O)
				return
*/