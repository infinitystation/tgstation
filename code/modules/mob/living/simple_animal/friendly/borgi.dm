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

//	TODO: Сделать код сборки Йе-На. ~Quardbreak

/obj/item/borgi_legs_w
	name = "metallic front legs"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	icon =  'icons/mob/infinity_mob.dmi'
	icon_state = "borgi_legs_w+o"
	item_state = "buildpipe"
	attack_verb = list("slapped", "punched")

/obj/item/borgi_legs_s
	name = "metallic hind legs"
	desc = "A pair of doggy legs limbs!"
	icon = 'icons/mob/infinity_mob.dmi'
	icon_state = "borgi_legs_s+o"
	item_state = "buildpipe"
	attack_verb = list("slapped", "punched")

/obj/item/borgi_chest
	name = "cyborg torso"
	desc = "A heavily reinforced case containing cyborg logic boards, with space for a standard power cell."
	icon = 'icons/mob/infinity_mob.dmi'
	icon_state = "borgi_chest+o"
	item_state = "buildpipe"
	var/wired = 0
	var/obj/item/weapon/stock_parts/cell/cell = null

/obj/item/borgi_chest/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/weapon/stock_parts/cell))
		if(src.cell)
			user << "<span class='warning'>Внутри уже есть батарейка!</span>"
			return
		else
			if(!user.unEquip(W))
				return
			W.loc = src
			src.cell = W
			user << "<span class='notice'>Вы установили батарейку в корпус.</span>"
	else if(istype(W, /obj/item/stack/cable_coil))
		if(src.wired)
			user << "<span class='warning'>Внутри уже есть провода!</span>"
			return
		var/obj/item/stack/cable_coil/coil = W
		if (coil.use(1))
			src.wired = 1
			user << "<span class='notice'>Вы подсоеденили внутри корпуса провода.</span>"
		else
			user << "<span class='warning'>Вам необходим минимум один моток провода дл&#255; этого!</span>"
	else
		return ..()

/obj/item/borgi_head
	name = "cyborg head"
	desc = "A standard reinforced braincase, with spine-plugged neural socket and sensor gimbals."
	item_state = "buildpipe"
	icon = 'icons/mob/infinity_mob.dmi'
	icon_state = "borgi_head"

/obj/item/borgi_disk
	name = "dog memory hardrive"
	desc = "Look at that cute puppy! If i could build body for him..."
	icon = 'icons/mob/infinity_mob.dmi'
	icon_state = "borgi_disk"

/obj/item/borgi_suit
	name = "borgi endoskeleton"
	desc = "Let's build him!"
	icon = 'icons/mob/infinity_mob.dmi'
	icon_state = "borgi_suit"
	var/obj/item/borgi_legs_w = null
	var/obj/item/borgi_legs_s = null
	var/obj/item/borgi_chest = null
	var/obj/item/borgi_head = null

/obj/item/borgi_suit/New()
	..()
	src.updateicon()

/obj/item/borgi_suit/proc/updateicon()
	src.cut_overlays()
	if(src.borgi_legs_s)
		src.add_overlay("borgi_legs_w+o")
	if(src.borgi_legs_w)
		src.add_overlay("borgi_legs_s+o")
	if(src.borgi_chest)
		src.add_overlay("borgi_chest+o")
	if(src.borgi_head)
		src.add_overlay("borgi_head+o")

/obj/item/borgi_suit/proc/check_completion()
	if(src.borgi_legs_w && src.borgi_legs_s)
		if(src.borgi_head && src.borgi_chest)
			feedback_inc("borgi_frames_built",1)
			return 1
	return 0

/obj/item/borgi_suit/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/borgi_legs_w))
		if(src.borgi_legs_w)
			return
		if(!user.unEquip(W))
			return
		W.forceMove(src)
		W.icon_state = initial(W.icon_state)
		W.cut_overlays()
		src.borgi_legs_w = W
		src.updateicon()

	else if(istype(W, /obj/item/borgi_legs_s))
		if(src.borgi_legs_s)
			return
		if(!user.unEquip(W))
			return
		W.forceMove(src)
		W.icon_state = initial(W.icon_state)
		W.cut_overlays()
		src.borgi_legs_s = W
		src.updateicon()

	else if(istype(W, /obj/item/borgi_chest))
		var/obj/item/borgi_chest/CH = W
		if(src.borgi_chest)
			return
		if(CH.wired && CH.cell)
			if(!user.unEquip(CH))
				return
			CH.forceMove(src)
			CH.icon_state = initial(CH.icon_state)
			CH.cut_overlays()
			src.borgi_chest = CH
			src.updateicon()
		else if(!CH.wired)
			user << "<span class='warning'>Сперва вам нужно подсоеденить провода!</span>"
		else
			user << "<span class='warning'>Вам необходимо вставить батарейку в корпус!</span>"

	else if(istype(W, /obj/item/borgi_head))
		if(src.borgi_head)
			return
		if(!user.unEquip(W))
			return
		W.forceMove(src)
		W.icon_state = initial(W.icon_state)
		W.cut_overlays()
		src.borgi_head = W
		src.updateicon()

	else if(istype(W, /obj/item/borgi_disk))
		if(check_completion())
			if(!isturf(loc))
				user << "<span class='warning'>Вам не удобно вставить носитель, поставьте заготовку на пол.</span>"
				return
			if(!user.unEquip(W))
				return
			user << "<span class='notice'>Вы вставили носитель информации в дисковод модели.</span>"
			var/mob/living/simple_animal/pet/dog/corgi/Ian/borgi/O = new /mob/living/simple_animal/pet/dog/corgi/Ian/borgi(get_turf(loc))
			qdel(W)

			if(!O)
				return

			W.loc = O
			src.loc = O
			qdel(src)
