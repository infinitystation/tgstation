/obj/item/device/assembly/flash
	name = "flash"
	desc = "A powerful and versatile flashbulb device, with applications ranging from disorienting attackers to acting as visual receptors in robot production."
	icon_state = "flash"
	item_state = "flashtool"
	throwforce = 0
	w_class = 1
	materials = list(MAT_METAL = 300, MAT_GLASS = 300)
	origin_tech = "magnets=2;combat=1"

	crit_fail = 0     //Is the flash burnt out?
	var/times_used = 0 //Number of times it's been used.
	var/last_used = 0 //last world.time it was used.


/obj/item/device/assembly/flash/update_icon(var/flash = 0)
	cut_overlays()
	attached_overlays = list()
	if(crit_fail)
		add_overlay("flashburnt")
		attached_overlays += "flashburnt"

	if(flash)
		add_overlay("flash-f")
		attached_overlays += "flash-f"
		spawn(5)
			update_icon()
	if(holder)
		holder.update_icon()

/obj/item/device/assembly/flash/proc/clown_check(mob/living/carbon/human/user)
	if(user.disabilities & CLUMSY && prob(50))
		flash_carbon(user, user, 15, 0)
		return 0
	return 1

/obj/item/device/assembly/flash/activate()
	if(!try_use_flash())
		return 0
	var/turf/T = get_turf(src)
	T.visible_message("<span class='disarm'>[src] emits a blinding light!</span>")
	for(var/mob/living/carbon/M in viewers(3, T))
		flash_carbon(M, null, 5, 0)


/obj/item/device/assembly/flash/proc/burn_out() //Made so you can override it if you want to have an invincible flash from R&D or something.
	if(!crit_fail)
		crit_fail = 1
		update_icon()
		var/turf/T = get_turf(src)
		if(T)
			T.visible_message("[src] burns out!")


/obj/item/device/assembly/flash/proc/flash_recharge(interval=10)
	if(prob(times_used * 3)) //The more often it's used in a short span of time the more likely it will burn out
		burn_out()
		return 0

	var/deciseconds_passed = world.time - last_used
	for(var/seconds = deciseconds_passed/10, seconds>=interval, seconds-=interval) //get 1 charge every interval
		times_used--

	last_used = world.time
	times_used = max(0, times_used) //sanity
	return 1

/obj/item/device/assembly/flash/proc/try_use_flash(mob/user = null)
	flash_recharge(10)

	if(crit_fail)
		return 0

	playsound(src.loc, 'sound/weapons/flash.ogg', 100, 1)
	update_icon(1)
	times_used++

	if(user && !clown_check(user))
		return 0

	return 1


/obj/item/device/assembly/flash/proc/flash_carbon(mob/living/carbon/M, mob/user = null, power = 15, targeted = 1)
	add_logs(user, M, "flashed", src)
	if(user && targeted)
		if(M.weakeyes)
			M.Weaken(3) //quick weaken bypasses eye protection but has no eye flash
		if(M.flash_act(1, 1))
			M.confused += power
			M.Stun(1)
			visible_message("<span class='disarm'>[user] blinds [M] with the flash!</span>")
			user << "<span class='danger'>You blind [M] with the flash!</span>"
			M << "<span class='userdanger'>[user] blinds you with the flash!</span>"
			if(M.weakeyes)
				M.Stun(2)
				M.visible_message("<span class='disarm'>[M] gasps and shields their eyes!</span>", "<span class='userdanger'>You gasp and shield your eyes!</span>")
		else
			visible_message("<span class='disarm'>[user] fails to blind [M] with the flash!</span>")
			user << "<span class='warning'>You fail to blind [M] with the flash!</span>"
			M << "<span class='danger'>[user] fails to blind you with the flash!</span>"
	else
		if(M.flash_act())
			M.confused += power

/obj/item/device/assembly/flash/attack(mob/living/M, mob/user)
	if(!try_use_flash(user))
		return 0

	if(iscarbon(M))
		flash_carbon(M, user, 5, 1)
		return 1

	else if(issilicon(M))
		var/mob/living/silicon/robot/R = M
		add_logs(user, R, "flashed", src)
		update_icon(1)
		M.Weaken(6)
		R.confused += 5
		R.flash_act(affect_silicon = 1)
		user.visible_message("<span class='disarm'>[user] overloads [R]'s sensors with the flash!</span>", "<span class='danger'>You overload [R]'s sensors with the flash!</span>")
		return 1

	user.visible_message("<span class='disarm'>[user] fails to blind [M] with the flash!</span>", "<span class='warning'>You fail to blind [M] with the flash!</span>")


/obj/item/device/assembly/flash/attack_self(mob/living/carbon/user, flag = 0, emp = 0)
	if(holder)
		return 0
	if(!try_use_flash(user))
		return 0
	user.visible_message("<span class='disarm'>[user]'s flash emits a blinding light!</span>", "<span class='danger'>Your flash emits a blinding light!</span>")
	for(var/mob/living/carbon/M in oviewers(3, null))
		flash_carbon(M, user, 1, 0)


/obj/item/device/assembly/flash/emp_act(severity)
	if(!try_use_flash())
		return 0
	if(iscarbon(loc))
		flash_carbon(loc, null, 10, 0)
	burn_out()
	..()


/obj/item/device/assembly/flash/cyborg
	origin_tech = null

/obj/item/device/assembly/flash/cyborg/attack(mob/living/M, mob/user)
	..()
	PoolOrNew(/obj/effect/overlay/temp/borgflash, get_turf(src))

/obj/item/device/assembly/flash/cyborg/attack_self(mob/user)
	..()
	PoolOrNew(/obj/effect/overlay/temp/borgflash, get_turf(src))

/obj/item/device/assembly/flash/cyborg/attackby(obj/item/weapon/W, mob/user, params)
	return

/obj/item/device/assembly/flash/memorizer
	name = "memorizer"
	desc = "If you see this, you're not likely to remember it any time soon."
	icon = 'icons/obj/device.dmi'
	icon_state = "memorizer"
	item_state = "nullrod"

/obj/item/device/assembly/flash/handheld //this is now the regular pocket flashes

/obj/item/device/assembly/flash/armimplant
	name = "photon projector"
	desc = "A high-powered photon projector implant normally used for lighting purposes, but also doubles as a flashbulb weapon. Self-repair protocals fix the flashbulb if it ever burns out."
	var/flashcd = 20
	var/overheat = 0
	var/obj/item/organ/cyberimp/arm/flash/I = null

/obj/item/device/assembly/flash/armimplant/burn_out()
	if(I && I.owner)
		I.owner << "<span class='warning'>Your photon projector implant overheats and deactivates!</span>"
		I.Retract()
	overheat = FALSE
	addtimer(src, "cooldown", flashcd * 2)

/obj/item/device/assembly/flash/armimplant/try_use_flash(mob/user = null)
	if(overheat)
		if(I && I.owner)
			I.owner << "<span class='warning'>Your photon projector is running too hot to be used again so quickly!</span>"
		return FALSE
	overheat = TRUE
	addtimer(src, "cooldown", flashcd)
	playsound(src.loc, 'sound/weapons/flash.ogg', 100, 1)
	update_icon(1)
	return TRUE


/obj/item/device/assembly/flash/armimplant/proc/cooldown()
	overheat = FALSE
