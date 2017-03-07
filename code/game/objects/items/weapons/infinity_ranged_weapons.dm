//Переносил всё сюда Terror4000rus (на данный момент). Если что-то забыл - добавьте. Нечего раскидывать по всему билду отдельные строчки кода.

/obj/item/weapon/gun/ballistic/automatic/xmg80 //By Terror4000rus
	name = "AA-XMG80"
	desc = "A state-of-the-art, high-tech assault rifle manufactured by Aussec Armory. Comes with a 2x red dot sight. Utilizes the uncommon 6.8x43mm caseless ammunition, which is light while still allowing for superior armor-piercing capability and high velocity. Often called 'The Shredder' for its immense damage potential, which also results in this firearm being banned in NanoTrasen-controlled sectors for being 'too messy' and expensive."
	icon_state = "xmg80"
	item_state = "c20r"
	icon = 'icons/obj/infinity_weapons.dmi'
	mag_type = /obj/item/ammo_box/magazine/xmg80
	can_suppress = 0
	w_class = 3
	burst_size = 2
	fire_delay = 1.5
	force = 10
	origin_tech = "combat=4;materials=4;syndicate=1"
	fire_sound = 'sound/weapons/gunshot_g36.ogg'

/obj/item/weapon/gun/ballistic/automatic/xmg80/update_icon()
	..()
	icon_state = "[initial(icon_state)][magazine ? "" : "-e"]"

/obj/item/weapon/gun/ballistic/automatic/xmg80/process_chamber(eject_casing = 0, empty_chamber = 1)
	..()

/obj/item/weapon/gun/ballistic/automatic/gause //By Terror4000rus
	name = "Gause rifle C-14"
	desc = "Тяжёла&#255; пушка для самых плохих парней - винтовка Гауса. Разгоняюща&#255; с помощью электромагнитного пол&#255; металлические 7-ми миллимитровые бронебойные патроны, это оружие готово уничтожить всё, что не понравитс&#255; его обладателю. Пускай ты и машина для убийства, по-македонски стрел&#255;ть не выйдет."
	icon_state = "c14"
	item_state = "c14"
	icon = 'icons/obj/infinity_weapons.dmi'
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	origin_tech = "combat=5;materials=3"
	pin = /obj/item/device/firing_pin
	mag_type = /obj/item/ammo_box/magazine/spine
	fire_sound = 'sound/weapons/gunshot_g36.ogg'
	can_suppress = 0
	burst_size = 3
	fire_delay = 1
	weapon_weight = WEAPON_HEAVY

/obj/item/weapon/gun/ballistic/automatic/proto/mindshield //By Terror4000rus
	pin = /obj/item/device/firing_pin/implant/mindshield

/obj/item/weapon/gun/ballistic/automatic/mg88 //By Terror4000rus
	name = "MG88 'Enforcer'"
	desc = "A robust assault rifle used by United Aerospace Corporation."
	icon_state = "mg88"
	item_state = "mg88"
	icon = 'icons/obj/infinity_weapons.dmi'
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	origin_tech = "combat=5;materials=3"
	mag_type = /obj/item/ammo_box/magazine/a646
	pin = /obj/item/device/firing_pin
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	burst_size = 2
	fire_delay = 1

/obj/item/weapon/gun/energy/alien/base //By Terror4000rus
	ammo_type = list(/obj/item/ammo_casing/energy/declone/special)
	can_pull_pin = 0
	selfcharge = 1
	cell_type = /obj/item/weapon/stock_parts/cell/ammo/high

/obj/item/projectile/energy/declone/special
	damage = 25
	damage_type = BURN
	irradiate = 5

/obj/item/weapon/gun/energy/e_gun/nuclear/event //By Terror4000rus
	pin = /obj/item/device/firing_pin
	ammo_type = list(/obj/item/ammo_casing/energy/laser, /obj/item/ammo_casing/energy/disabler)

/obj/item/weapon/gun/energy/e_gun/ert
	cell_type = /obj/item/weapon/stock_parts/cell/ammo/high

/obj/item/weapon/melee/classic_baton/telescopic/energy
	name = "telescopic energy baton"
	desc = "An advanced melee weapon that self-generates energy through ambiant electromagnetic fields. While this is extremely slow and weak, it is enough to charge the device to output an incapacitating shock when used. \
		The downside is, its power mechanism takes the space of a button-lock, so it can not be used when completely discharged, and always stuns when active."
	icon = 'icons/obj/infinity_weapons.dmi'
	icon_state = "telebaton-energy_0"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	var/hitcost = 100
	var/energy = 1500
	var/maxenergy = 1500
	var/rechargeamt = 100
	var/initial_stunamt = 1
	var/initial_damage = 2
	var/final_stunamt = 5
	var/final_damage = 2
	var/hit_combo = 5
	var/current_combo = 0
	var/hit_combo_clickdelay = 3
	var/unlock_ticks = 2
	var/unlock_tick = 0
	var/hit_combo_interrupt_pull = TRUE
	var/normal_clickdelay = 20
	var/mob/living/locked = null
	hitsound = 'sound/weapons/shockhit.ogg'

/obj/item/weapon/melee/classic_baton/telescopic/energy/New()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/weapon/melee/classic_baton/telescopic/energy/process()
	energy = Clamp(energy + rechargeamt, 0, maxenergy)
	if(locked)
		unlock_tick++
		if(unlock_tick == unlock_ticks)
			current_combo = 0
			locked = null

/obj/item/weapon/melee/classic_baton/telescopic/energy/attack_self(mob/user)
	if(energy < hitcost)
		user << "<span class='warning'>The [src] does not have enough energy to extend!</span>"
		return FALSE
	if(on)
		retract(user)
	else
		extend(user)
	add_fingerprint(user)

/obj/item/weapon/melee/classic_baton/telescopic/energy/proc/extend(mob/living/user = null)
	icon_state = "telebaton-energy_1"
	item_state = "telebaton-energy"
	w_class = WEIGHT_CLASS_BULKY
	force = 10
	attack_verb = list("smacked", "struck", "knocks over", "whacks")
	playsound(src.loc, 'sound/weapons/ebatonextend.ogg', 50, 1)
	on = TRUE
	if(user)
		user << "<span class ='warning'>You extend and charge the baton.</span>"

/obj/item/weapon/melee/classic_baton/telescopic/energy/proc/retract(mob/living/user = null)
	icon_state = "telebaton-energy_0"
	item_state = null
	w_class = WEIGHT_CLASS_SMALL
	force = 0
	attack_verb = list("hit", "poked")
	playsound(src.loc, 'sound/effects/sparks4.ogg', 50, 1)
	on = FALSE
	if(user)
		user << "<span class ='notice'>You collapse the baton.</span>"

/obj/item/weapon/melee/classic_baton/telescopic/energy/attack(mob/living/target, mob/living/user)
	if(!on)
		return ..()
	add_fingerprint(user)
	if((CLUMSY in user.disabilities) && prob(50))
		user << "<span class ='danger'>You club yourself over the head as you simply are too clumsy to be using this advanced weapon.</span>"
		user.Weaken(3 * force)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.apply_damage(2*force, BRUTE, "head")
		else
			user.take_bodypart_damage(2*force)
		return
	if(iscyborg(target))	//No ninjaing cyborgs.
		return ..()
	if(!iscarbon(target))	//No point stunning things that can't be stunned.
		return ..()
	if(!locked)
		locked = target
	else if(locked != target)
		locked = target
		baton_hit(target, user, user.a_intent)
		user.changeNext_move(normal_clickdelay)
		return
	user.changeNext_move(hit_combo_clickdelay)
	baton_hit(target, user, user.a_intent)
	energy -= hitcost
	if(energy < hitcost)
		retract()

/obj/item/weapon/melee/classic_baton/telescopic/energy/proc/baton_hit(mob/living/carbon/target, mob/living/user, intent)
	current_combo++
	if(hit_combo_interrupt_pull && (user.pulling == target))
		user.stop_pulling()
	var/attackverb = "stuns"
	if(current_combo >= hit_combo)
		target.Weaken(final_stunamt)
		if(intent == INTENT_HARM)
			attackverb = "beats"
			var/obj/item/bodypart/affecting = target.get_bodypart(ran_zone(user.zone_selected))
			if(!affecting)
				affecting = target.bodyparts[1]
			target.apply_damage(final_damage, damtype, affecting)
			user.do_attack_animation(target)
		user.visible_message("<span class='danger'>[user] [attackverb] [target] with the [src]!</span>")
		locked = null
		current_combo = 0
		user.changeNext_move(normal_clickdelay)
		playsound(user.loc, 'sound/weapons/shockhit.ogg', 50, 1)
	else
		target.Weaken(initial_stunamt)
		if(intent == INTENT_HARM)
			attackverb = "beats"
			var/obj/item/bodypart/affecting = target.get_bodypart(ran_zone(user.zone_selected))
			if(!affecting)
				affecting = target.bodyparts[1]
			user.do_attack_animation(target)
			target.apply_damage(initial_damage, damtype, affecting)
		user.visible_message("<span class='danger'>[user] [pick(attack_verb)] [target] with [src]!</span>")
		playsound(user.loc, 'sound/effects/woodhit.ogg', 50, 1)
		add_logs(user, target, "[attackverb]", src.name, "(INTENT: [uppertext(user.a_intent)]) (DAMTYPE: [uppertext(damtype)])")