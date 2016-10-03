/obj/item/weapon/melee/baton/shocker
	name = "shocker"
	desc = "Nanotrasen warns: Do not use a small-capacitive battery!"
	icon = 'icons/obj/infinity_weapons.dmi'
	icon_state = "shocker"
	item_state = "shocker"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	force = 0
	throwforce = 0
	stunforce = 5
	hitcost = 1350
	w_class = 2
	attack_verb = list("shocked")
	slot_flags = SLOT_BELT
	throw_hit_chance = 0

/obj/item/weapon/melee/baton/shocker/loaded/New()
	..()
	bcell = new(src)
	update_icon()
	return
