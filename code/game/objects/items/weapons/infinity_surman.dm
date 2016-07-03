//По просьбе Nymary

/obj/item/weapon/pickaxe/speardrill
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

//Под моим авторством

//Все ещё думаю, как их лучше всего сделать

/obj/item/weapon/knuckles
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

//Спрайты Нумари

/obj/item/weapon/blue_devil
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

/obj/item/weapon/storage/sheath/blue_devil
	name = "sheath"
	desc = "Sheath, what can hold all power of blue devil katana."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "devil-closed"
	slot_flags = SLOT_BELT | SLOT_BACK
	attack_verb = "lashed"
	worn_icon = 'icons/mob/infinity_work.dmi'
	can_hold = list(/obj/item/weapon/blue_devil)
	storage_slots = 1

/obj/item/weapon/melee/classic_baton/katana
	name = "wood katana"
	desc = "Wooden katana. Made for training."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "wood_katana"
	item_state = "wood_katana"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	slot_flags = SLOT_BELT

/obj/item/weapon/twohanded/skipping_rope
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

/obj/item/weapon/reagent_containers/food/drinks/cup
	name = "cup"
	desc = "Just a cup."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "big_cup"

/obj/item/weapon/reagent_containers/food/drinks/cup/soviet
	desc = "For the space-motherland!"
	icon_state = "soviet_cup"

/obj/item/weapon/reagent_containers/food/drinks/cup/cult
	desc = "Nar'sie <3"
	icon_state = "soviet_cup"

/obj/item/weapon/reagent_containers/food/drinks/cup/med
	desc = "What a lovely cup of morphine."
	icon_state = "med_cup"

/obj/item/weapon/reagent_containers/food/drinks/cup/med/black
	desc = "What a lovely cup of morphine, and bullets instead of cookies."
	icon_state = "black_med_cup"

/obj/item/weapon/reagent_containers/food/drinks/cup/mesa
	desc = "Barney, it's not a beer."
	icon_state = "mesa_cup"

/obj/item/weapon/reagent_containers/food/drinks/cup/lambda
	desc = "RolePlay-Life 2/3"
	icon_state = "lambda_cup"

/obj/item/weapon/reagent_containers/food/drinks/cup/no1
	desc = "#1"
	icon_state = "no1_cup"

/obj/item/weapon/reagent_containers/food/drinks/cup/nt
	desc = "NanoTrasen special."
	icon_state = "nt_cup"

/obj/item/weapon/reagent_containers/food/drinks/cup/engi
	desc = "Heating tea with welding tool."
	icon_state = "light_power_cup"

/obj/item/weapon/reagent_containers/food/drinks/cup/engi/power
	desc = "Heating tea with tesla engine!."
	icon_state = "power_cup"

/obj/item/weapon/reagent_containers/food/drinks/cup/death
	desc = "Every gulp like a last."
	icon_state = "death_cup"

/obj/item/weapon/reagent_containers/food/drinks/cup/terran
	desc = "To the last drop! Like in the fight, but to the last bullet!"
	icon = 'code/modules/surman_nymary/surman_object.dmi'
	icon_state = "terran_cup"