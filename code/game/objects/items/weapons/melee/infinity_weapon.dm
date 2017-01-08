/obj/item/weapon/pickaxe/speardrill //By Surman
	name = "speardrill"
	desc = "Just a spear with a drill on the end. Good enough for break stones, or skulls."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "speardrill"
	item_state = "speardrill"
	force = 20
	throwforce = 15
	throw_speed = 3
	throw_range = 4
	embedded_impact_pain_multiplier = 4
	w_class = 2
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	digspeed = 20

/obj/item/weapon/knuckles //By Surman
	name = "knuckles"
	desc = "Iron knuckles. Punch face."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "knuckles"
	item_state = "knuckles"
	force = 10
	throwforce = 0 //Кидать кастет, серьезно?
	embedded_impact_pain_multiplier = 0
	w_class = 1
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	attack_verb = list("punched", "hit")

/obj/item/weapon/blue_devil //By Numary
	name = "blue devil"
	desc = "Blue fire katana."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "blue_devil"
	item_state = "blue_devil"
	force = 60
	throwforce = 55
	embedded_impact_pain_multiplier = 4
	w_class = 2
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'

/obj/item/weapon/storage/sheath/blue_devil //By Numary
	name = "sheath"
	desc = "Sheath, what can hold all power of blue devil katana."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "devil-closed"
	slot_flags = SLOT_BELT | SLOT_BACK
	attack_verb = "lashed"
	worn_icon = 'icons/mob/infinity_work.dmi'
	can_hold = list(/obj/item/weapon/blue_devil)
	storage_slots = 1

/obj/item/weapon/melee/classic_baton/katana //By Terror4000rus
	name = "wood katana"
	desc = "Wooden katana. Made for training."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "wood_katana"
	item_state = "wood_katana"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	slot_flags = SLOT_BELT

/obj/item/weapon/twohanded/skipping_rope //By Numary
	name = "skipping rope"
	desc = "Jump, jump, jump, jump, jump!"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "skippingrope0"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	force = 5
	throwforce = 0


/obj/item/weapon/twohanded/skipping_rope/update_icon()
	icon_state = "skippingrope[wielded]"
	return

/obj/item/weapon/honkspear //By Inriss
	name = "Honk Spear"
	desc = "It is a spear and it Honk"
	icon = 'icons/obj/infinity_inriss.dmi'
	lefthand_file = 'icons/obj/infinity_inriss_left.dmi'
	righthand_file = 'icons/obj/infinity_inriss_right.dmi'
	icon_state = "honk_spear_item"
	item_state = "honk_spear"
	force = 1
	throwforce = 1
	hitsound = 'sound/items/bikehorn.ogg'
	w_class = 1
	throw_speed = 3
	throw_range = 7
	attack_verb = list("HONKED")

/obj/item/weapon/naomikatana //By Surman
	name = "Naomi Katana"
	desc = "Wonderful Naomi"
	icon = 'icons/obj/infinity_inriss.dmi'
	icon_state = "nkatana"
	item_state = "nkatana"
	righthand_file = 'icons/obj/infinity_inriss_right.dmi'
	lefthand_file = 'icons/obj/infinity_inriss_left.dmi'
	worn_icon = 'icons/obj/nkatana_belt.dmi'
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 40
	throwforce = 10
	w_class = 3
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/weapon/melee/baton/shocker //By Bill-Luxe
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

/obj/item/weapon/melee/energy/energysword //By Surman
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

/obj/item/weapon/pickaxe/bone
	icon = 'icons/obj/infinity_weapons.dmi'
	icon_state = "bonepickaxe"
	item_state = "bpickaxe"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	materials = list()
	origin_tech = ""
