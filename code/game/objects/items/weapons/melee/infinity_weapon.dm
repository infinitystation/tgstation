/obj/item/weapon/melee/energy/energysword
	name = "Enqual Sword"
	desc = "For great space heroes"
	icon = 'icons/obj/infinity_weapons.dmi'
	icon_state = "energysword0"
	item_state = "energysword0"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	force = 3
	throwforce = 5
	hitsound = "swing_hit" //it starts deactivated
	throw_speed = 3
	throw_range = 5
	embed_chance = 75
	armour_penetration = 50
	block_chance = 50
	var/on = 0

/obj/item/weapon/melee/energy/energysword/attack_self(mob/user)
	on = !on
	if(on)
		user << "<span class ='warning'>You activated Enqual Sword</span>"
		icon = 'icons/obj/infinity_weapons.dmi'
		icon_state = "energysword1"
		item_state = "energysword1"
		w_class = 4
		force = 10
		attack_verb = list("smacked", "struck", "cracked", "beaten")
		playsound(user, 'sound/weapons/saberon.ogg', 35, 1)
	else
		user << "<span class ='notice'>You deactivated Enqual Sword</span>"
		icon = 'icons/obj/infinity_weapons.dmi'
		icon_state = "energysword0"
		item_state = "energysword0"
		w_class = 2
		force = 0 //not so robust now
		attack_verb = list("hit", "poked")
		playsound(user, 'sound/weapons/saberoff.ogg', 35, 1)

/obj/item/weapon/melee/baton/shocker
	name = "shocker"
	desc = "Zap-zap!"
	icon = 'icons/obj/infinity_weapons.dmi'
	icon_state = "shocker"
	item_state = "shocker"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	force = 0
	throwforce = 0
	stunforce = 6
	hitcost = 1000
	w_class = 2
	attack_verb = list("shocked")
	slot_flags = SLOT_BELT

obj/item/weapon/melee/baton/shocker/baton_stun(mob/living/L, mob/user)
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(H.check_shields(0, "[user]'s [name]", src, MELEE_ATTACK)) //No message; check_shields() handles that
			playsound(L, 'sound/weapons/Genhit.ogg', 50, 1)
			return 0
	if(isrobot(loc))
		var/mob/living/silicon/robot/R = loc
		if(!R || !R.cell || !R.cell.use(hitcost))
			return 0
	else
		if(!deductcharge(hitcost))
			return 0

	user.lastattacked = L
	L.lastattacker = user

	L.Stun(stunforce)
	L.Weaken(stunforce)
	L.apply_effect(STUTTER, stunforce)

	L.visible_message("<span class='danger'>[user] has shocked [L] with [src]!</span>", \
							"<span class='userdanger'>[user] has shocked you with [src]!</span>")
	playsound(loc, 'sound/weapons/shocker_attack.ogg', 50, 1, -1)

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.forcesay(hit_appends)

	add_logs(user, L, "shocked")
	return 1

/obj/item/weapon/melee/baton/shocker/loaded/New() //this one starts with a cell pre-installed.
	..()
	bcell = new(src)
	update_icon()
	return