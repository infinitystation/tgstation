/obj/item/weapon/fan
	name = "black fox fan"
	desc = "So fancy."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "dei_foxfan_closed"
	item_state = null
	w_class = 2
	force = 0
	var/on = 0

/obj/item/weapon/fan/attack_self(mob/user)
	on = !on
	if(on)
		user << "<span class ='notice'>You revealed the fan.</span>"
		icon_state = "dei_foxfan_open"
		item_state = "dei_foxfan_open"
		attack_verb = "waved"
		lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
		righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
		w_class = 4
	else
		user << "<span class ='notice'>You close the fan.</span>"
		icon_state = "dei_foxfan_closed"
		w_class = 2
		attack_verb = "poked"
		item_state = null

	add_fingerprint(user)

/obj/item/weapon/fan/attack(mob/living/carbon/C, mob/living/carbon/human/user)
	if(on)
		user.visible_message("[user] wave air on [C] with [src]!</span>", \
							"<span class='notice'>You wave air on [C] with [src]!</span>")
	else
		return