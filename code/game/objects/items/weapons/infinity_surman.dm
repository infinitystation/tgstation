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
