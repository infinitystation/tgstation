/mob/living/simple_animal/drone/construction //Elite drone, yay!
	name = "Construction drone"
	desc = "A Elite drone, for building stations."
	icon = 'icons/mob/infinity_robots.dmi'
	icon_state = "constructiondrone"
	icon_living = "constructiondrone"
	picked = TRUE
	health = 30
	maxHealth = 50
	speak_emote = list("declare")
	default_storage = /obj/item/weapon/storage/backpack/dufflebag/constructiondrone

obj/item/drone_shell/construction
	name = "construction drone shell"
	desc = "A shell of a construction drone, with mission build the stations." //Eghh, i thing my english baaad.
	drone_type = /mob/living/simple_animal/drone/construction

/obj/item/weapon/storage/backpack/dufflebag/constructiondrone
	name = "construction drone dufflebag"
	desc = "A large dufflebag for holding tools and hats, made by NT robotics."
	icon_state = "duffle-drone"
	item_state = "duffle-drone"
	burn_state = FIRE_PROOF

/obj/item/weapon/storage/backpack/dufflebag/constructiondrone/New()
	..()

	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool/largetank(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/stack/cable_coil/white(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/device/multitool(src)
	new /obj/item/weapon/rcd/combat(src) //We gonna make elite drone.
	new /obj/item/weapon/pipe_dispenser(src)
