/obj/item/clothing/mask/priest
	name = "ancient mask"
	desc = "An ordinary, rather rough mask from the bones and blood veins of a certain creature... What a mess..."
	icon_state = "priest_mask"
	icon = 'icons/ash_death.dmi'
	worn_icon = 'icons/ash_death_wear.dmi'
	flags_inv = HIDEFACE
	visor_flags_inv = HIDEFACE

/obj/item/clothing/head/helmet/ash
	name = "ancient helmet"
	desc = "Unpleasant to look at the mask of blood veins of some forgotten the Lord's creatures ..."
	icon_state = "ash_head_wear"
	icon = 'icons/ash_death.dmi'
	worn_icon = 'icons/ash_death_wear.dmi'
	flags_inv = HIDEEARS

/obj/item/clothing/under/loincloth
	name = "ancient loincloth"
	desc = "Roughly a loincloth made of a plate Goliath and blood veins..."
	icon_state = "goliath_hide_yubka"
	icon = 'icons/ash_death.dmi'
	worn_icon = 'icons/ash_death_wear.dmi'

/obj/item/weapon/shield/riot/ash
	name = "goliath-plate shield"
	desc = "Fireproof shield from the shell of an ancient beast..."
	icon_state = "goliath_shield"
	icon = 'icons/ash_death.dmi'
	worn_icon = 'icons/ash_death_wear.dmi'
	block_chance = 30

/obj/item/weapon/primitive_sword
	name = "bone sword"
	desc = "Ugly, but dangerous-looking sword from the bones..."
	icon_state = "primitive_sword"
	icon = 'icons/ash_death.dmi'
	worn_icon = 'icons/ash_death_wear.dmi'
	righthand_file = 'icons/ash_death_wear.dmi'
	lefthand_file = 'icons/ash_death_wear.dmi'
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 20
	throwforce = 8
	w_class = 3
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")


/obj/item/weapon/javelin
	name = "javelin"
	desc = "Long javelin, good hit your opponents."
	icon_state = "javeline"
	icon = 'icons/ash_death.dmi'
	worn_icon = 'icons/ash_death_wear.dmi'
	righthand_file = 'icons/ash_death_wear.dmi'
	lefthand_file = 'icons/ash_death_wear.dmi'
	force = 10
	throwforce = 20
	throw_speed = 4
	embedded_pain_multiplier = 4
	w_class = 4
	embed_chance = 70
	embedded_fall_chance = 60
	sharpness = IS_SHARP
	materials = list(MAT_METAL=600)
	slot_flags = SLOT_BACK

/obj/item/ammo_box/magazine/javelin
	name = "javelin kolchan"
	icon_state = "sinew_kolchan-1"
	icon = 'icons/ash_death.dmi'
	worn_icon = 'icons/ash_death_wear.dmi'
	righthand_file = 'icons/ash_death_wear.dmi'
	lefthand_file = 'icons/ash_death_wear.dmi'
	origin_tech = "combat=1"
	ammo_type = /obj/item/weapon/javelin
	max_ammo = 3
	w_class = 4
	slot_flags = SLOT_BELT

/obj/item/ammo_box/magazine/javelin/update_icon()
	..()
	icon_state = "sinew_kolchan-[round(ammo_count(),1)]"
