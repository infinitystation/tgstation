/obj/item/clothing/shoes/jackboots/guard
	name = "jackboots"
	desc = "Стандартные берцы имперского гвардейца, с застежками и креплением для ножа - не думаю, что мне это поможет..."
//	icon = //'ПОСТАВЬ МЕНЯ НА МЕСТО!'
//	icon_state = //"ПОСТАВЬ МЕНЯ НА МЕСТО!"
	strip_delay = 70
	put_on_delay = 50
	burn_state = FIRE_PROOF
	can_hold_items = 1

/obj/item/weapon/gun/energy/laser/guard
	name = "lasgun"
	desc = "Стандартнйы лазган имперского гвардейца, без подствольного фонарика, гранатомета, огнемета, штыка... КажетсЯ, мы в невыгодном положении..."
	icon_state = "laser"
	item_state = "laser"
	w_class = 3
	materials = list(MAT_METAL=4500)
	origin_tech = "combat=5;magnets=3"
//	icon = //'ПОСТАВЬ МЕНЯ НА МЕСТО!'
//	icon_state = //"ПОСТАВЬ МЕНЯ НА МЕСТО!"
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun)
	ammo_x_offset = 1
	shaded_charge = 1
	cell_type = /obj/item/weapon/stock_parts/cell/ammo/high
	burn_state = FIRE_PROOF

/obj/item/weapon/gun/energy/laser/guard/sc_laser

/obj/item/weapon/gun/projectile/automatic/c20r/sc_laser/New()
	..()
	for(var/ammo in magazine.stored_ammo)
		if(prob(70)) //95% chance
			magazine.stored_ammo -= ammo

/obj/item/clothing/suit/armor/guard
	name = "Trooper Armor"
	desc = "С виду тЯжелая броня с двумЯ поручнЯми по краЯм... Стоп, она стальная?"
	worn_icon = 'icons/mob/uac/suit.dmi'
//	icon = //'ПОСТАВЬ МЕНЯ НА МЕСТО!'
//	icon_state = //"ПОСТАВЬ МЕНЯ НА МЕСТО!"
	strip_delay = 90
	put_on_delay = 100
	armor = list(melee = 45, bullet = 50, laser = 35, energy = 20, bomb = 35, bio = 0, rad = 0)
	burn_state = FIRE_PROOF

/obj/item/clothing/head/helmet/guard
	name = "helmet"
	desc = "Standard Security gear. Protects the head from impacts."
//	icon = //'ПОСТАВЬ МЕНЯ НА МЕСТО!'
//	icon_state = //"ПОСТАВЬ МЕНЯ НА МЕСТО!"
	flags = HEADBANGPROTECT | BLOCKHAIR
	armor = list(melee = 25, bullet = 15, laser = 25,energy = 10, bomb = 25, bio = 0, rad = 0)
	strip_delay = 30
	burn_state = FIRE_PROOF

/obj/item/clothing/under/warden_corporate
	name = "warden corporate uniform"
	desc = "Unusual warden's uniform."
//	icon = //'ПОСТАВЬ МЕНЯ НА МЕСТО!'
//	icon_state = //"ПОСТАВЬ МЕНЯ НА МЕСТО!"
//	worn_icon = //'ПОСТАВЬ МЕНЯ НА МЕСТО!'
	can_adjust = 0
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	alt_covers_chest = 1

/obj/structure/barricade/guard
	name = "guard barrier"
	desc = "Портативный баррьер империума, используется силами ИГ или СПО для замедления продвижения войск противника - идеально простреливается."
	icon = 'icons/obj/objects.dmi'
	icon_state = "barrier0"
	density = 1
	anchored = 1
	health = 9000
	maxhealth = 9000
	proj_pass_rate = 90
	unacidable = 1