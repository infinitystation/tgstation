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

