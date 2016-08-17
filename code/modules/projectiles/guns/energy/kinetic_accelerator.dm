/obj/item/weapon/gun/energy/kinetic_accelerator
	name = "proto-kinetic accelerator"
	desc = "In the year 2544, only a year after the discovery of a potentially \
		world-changing substance, now colloquially referred to as plasma, the \
		Nanotrasen-UEG mining conglomerate introduced a prototype of a gun-like \
		device intended for quick, effective mining of plasma in the low \
		pressures of the solar system. Included in this presentation were \
		demonstrations of the gun being fired at collections of rocks contained \
		in vacuumed environments, obliterating them instantly while maintaining \
		the structure of the ores buried within them. Additionally, volunteers \
		were called from the crowd to have the gun used on them, only proving that \
		the gun caused little harm to objects in standard pressure. \n\
		An official from an unnamed, now long dissipated company observed this \
		presentation and offered to share their self-recharger cells, powered \
		by the user's bioelectrical field, another new and unknown technology. \
		They warned that the cells were incredibly experimental and several times \
		had injured workers, but the scientists as Nanotrasen were unable to resist \
		the money-saving potential of self recharging cells. Upon accepting this \
		offer, it took only a matter of days to prove the volatility of these cells, \
		as they exploded left and right whenever inserted into the prototype devices, \
		only throwing more money in the bin. \n\
		Whenever the Nanotrasen scientists were on the edge of giving up, a \
		breakthrough was made by head researcher Miles Parks McCollum, who \
		demonstrated that the cells could be stabilized when exposed to radium \
		then cooled with cryostylane. After this discovery, the low pressure gun, \
		now named the Kinetic Accelerator, was hastily completed and made compatible \
		with the self-recharging cells. As a result of poor testing, the currently \
		used guns lose their charge when not in use, and when two Kinetic Accelerators \
		come in proximity of one another, they will interfere with each other. Despite \
		this, the shoddy guns still see use in the mining of plasma to this day."
	icon_state = "kineticgun"
	item_state = "kineticgun"
	ammo_type = list(/obj/item/ammo_casing/energy/kinetic)
	cell_type = /obj/item/weapon/stock_parts/cell/emproof
	cell_removing = 0
	// Apparently these are safe to carry? I'm sure goliaths would disagree.
	needs_permit = 0
	var/range_add
	upgrades = list("diamond" = 0, "screwdriver" = 0, "plasma" = 0)
	unique_rename = 1
	can_pull_pin = 0
	origin_tech = "combat=3;powerstorage=3;engineering=3"
	weapon_weight = WEAPON_LIGHT
	can_flashlight = 1
	flight_x_offset = 15
	flight_y_offset = 9
	var/overheat_time = 16
	var/holds_charge = FALSE
	var/unique_frequency = FALSE // modified by KA modkits
	var/overheat = FALSE


/obj/item/weapon/gun/energy/kinetic_accelerator/newshot()
	..()
	if(chambered && chambered.BB)
		var/obj/item/projectile/kinetic/charge = chambered.BB
		charge.range += range_add

/obj/item/weapon/gun/energy/kinetic_accelerator/proc/modify_projectile(obj/item/projectile/kinetic/K)
	for(var/obj/item/modkit/M in src)
		M.modify_projectile(K)

/obj/item/weapon/gun/energy/kinetic_accelerator/attackby(obj/item/weapon/W as obj, mob/user as mob, params)
	if(istype(W, /obj/item/weapon/screwdriver) && upgrades["screwdriver"] < 3)
		upgrades["screwdriver"]++
		overheat_time = max(0, overheat_time-1)
		user << "<span class='info'>You tweak [src]'s thermal exchanger.</span>"

	else if(istype(W, /obj/item/stack))
		var/obj/item/stack/S = W

		if(istype(S, /obj/item/stack/sheet/mineral/diamond) && upgrades["diamond"] < 3)
			upgrades["diamond"]++
			overheat_time = max(0, overheat_time-3)
			user << "<span class='info'>You upgrade [src]'s thermal exchanger with diamonds.</span>"
			S.use(1)
		if(istype(S, /obj/item/stack/sheet/mineral/plasma) && upgrades["plasma"] < 3)
			upgrades["plasma"]++
			range_add++
			user << "<span class='info'>You upgrade [src]'s accelerating chamber with plasma.</span>"
			S.use(1)

	return ..()


/* /obj/item/weapon/gun/energy/kinetic_accelerator/super
	name = "super-kinetic accelerator"
	desc = "An upgraded, superior version of the proto-kinetic accelerator."
	icon_state = "kineticgun_u"
	ammo_type = list(/obj/item/ammo_casing/energy/kinetic/super)
	overheat_time = 15
	origin_tech = "materials=5;powerstorage=3;engineering=4;magnets=3;combat=3" */

/obj/item/weapon/gun/energy/kinetic_accelerator/hyper
	name = "hyper-kinetic accelerator"
	desc = "An upgraded, even more superior version of the proto-kinetic accelerator."
	icon_state = "kineticgun_h"
	ammo_type = list(/obj/item/ammo_casing/energy/kinetic/hyper)
	overheat_time = 14
	origin_tech = "materials=6;powerstorage=4;engineering=4;magnets=4;combat=4"

/obj/item/weapon/gun/energy/kinetic_accelerator/cyborg
	holds_charge = TRUE
	unique_frequency = TRUE

/obj/item/weapon/gun/energy/kinetic_accelerator/hyper/cyborg
	holds_charge = TRUE
	unique_frequency = TRUE

/obj/item/weapon/gun/energy/kinetic_accelerator/New()
	. = ..()
	if(!holds_charge)
		empty()

/obj/item/weapon/gun/energy/kinetic_accelerator/shoot_live_shot()
	. = ..()
	attempt_reload()

/obj/item/weapon/gun/energy/kinetic_accelerator/equipped(mob/user)
	. = ..()
	if(!can_shoot())
		attempt_reload()

/obj/item/weapon/gun/energy/kinetic_accelerator/dropped()
	. = ..()
	if(!holds_charge)
		// Put it on a delay because moving item from slot to hand
		// calls dropped().
		sleep(1)
		if(!ismob(loc))
			empty()

/obj/item/weapon/gun/energy/kinetic_accelerator/proc/empty()
	power_supply.use(500)
	update_icon()

/obj/item/weapon/gun/energy/kinetic_accelerator/proc/attempt_reload()
	if(overheat)
		return
	overheat = TRUE

	var/carried = 0
	if(!unique_frequency)
		for(var/obj/item/weapon/gun/energy/kinetic_accelerator/K in \
			loc.GetAllContents())

			carried++

		carried = max(carried, 1)
	else
		carried = 1

	addtimer(src, "reload", overheat_time * carried)

/obj/item/weapon/gun/energy/kinetic_accelerator/emp_act(severity)
	return

/obj/item/weapon/gun/energy/kinetic_accelerator/proc/reload()
	power_supply.give(500)
	if(!suppressed)
		playsound(src.loc, 'sound/weapons/kenetic_reload.ogg', 60, 1)
	else
		loc << "<span class='warning'>[src] silently charges up.<span>"
	update_icon()
	overheat = FALSE

/obj/item/weapon/gun/energy/kinetic_accelerator/update_icon()
	cut_overlays()
	if(!can_shoot())
		add_overlay("kineticgun_empty")

	if(F && can_flashlight)
		var/iconF = "flight"
		if(F.on)
			iconF = "flight_on"
		add_overlay(image(icon = icon, icon_state = iconF, pixel_x = flight_x_offset, pixel_y = flight_y_offset))










//Casing


/obj/item/ammo_casing/energy/kinetic
	projectile_type = /obj/item/projectile/kinetic
	select_name = "kinetic"
	e_cost = 500
	fire_sound = 'sound/weapons/Kenetic_accel.ogg' // fine spelling there chap

/obj/item/ammo_casing/energy/kinetic/ready_proj(atom/target, mob/living/user, quiet, zone_override = "")
	..()
	if(loc && istype(loc, /obj/item/weapon/gun/energy/kinetic_accelerator))
		var/obj/item/weapon/gun/energy/kinetic_accelerator/KA = loc
		KA.modify_projectile(BB)

/obj/item/ammo_casing/energy/kinetic/hyper
	projectile_type = /obj/item/projectile/kinetic/hyper



//Projectiles

/obj/item/projectile/kinetic
	name = "kinetic force"
	icon_state = null
	damage = 10
	damage_type = BRUTE
	flag = "bomb"
	range = 3
	var/damage_multiplier = 4

/obj/item/projectile/kinetic/super
	damage = 11
	range = 4

/obj/item/projectile/kinetic/New()
	var/turf/proj_turf = get_turf(src)
	if(!istype(proj_turf, /turf))
		return
	var/datum/gas_mixture/environment = proj_turf.return_air()
	var/pressure = environment.return_pressure()
	if(pressure < 50)
		name = "full strength [name]"
		damage *= damage_multiplier
	..()

/obj/item/projectile/kinetic/on_range()
	PoolOrNew(/obj/effect/overlay/temp/kinetic_blast, loc)
	..()

/obj/item/projectile/kinetic/on_hit(atom/target)
	var/turf/target_turf= get_turf(target)
	if(istype(target_turf, /turf/closed/mineral))
		var/turf/closed/mineral/M = target_turf
		M.gets_drilled(firer)
	PoolOrNew(/obj/effect/overlay/temp/kinetic_blast, target_turf)
	. = ..()


//AoE

/obj/item/projectile/kinetic/hyper
	name = "kinetic explosion"
	damage = 10
	range = 3

/obj/item/projectile/kinetic/hyper/proc/aoe_blast(atom/target)
	var/turf/target_turf = get_turf(target)
	if(!target_turf)
		target_turf = get_turf(src)
	PoolOrNew(/obj/effect/overlay/temp/explosion/fast, target_turf)
	for(var/T in RANGE_TURFS(1, target_turf) - target_turf)
		if(istype(T, /turf/closed/mineral))
			var/turf/closed/mineral/M = T
			M.gets_drilled(firer)

/obj/item/projectile/kinetic/hyper/on_range()
	aoe_blast()
	..()

/obj/item/projectile/kinetic/hyper/on_hit(atom/target)
	aoe_blast(target)
	. = ..()





//Modkits

/obj/item/modkit
	name = "modification kit"
	desc = "An upgrade for kinetic accelerators.."
	icon = 'icons/obj/objects.dmi'
	icon_state = "modkit"
	origin_tech = "programming=2;materials=2;magnets=4"
	var/cost = 2

/obj/item/modkit/proc/install(obj/item/weapon/gun/energy/kinetic_accelerator/KA)
	return

/obj/item/modkit/proc/modify_projectile(/obj/item/projectile/kinetic/K)
	return