/obj/item/clothing/suit/space/bobafett_suit
	name = "bobafett suit"
	desc = "A long time ago..."
	icon_state = "bobafett_suit"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	armor = list(melee = 30, bullet = 30, laser = 30,energy = 30, bomb = 30, bio = 20, rad = 10, fire = 0, acid = 50)
	item_state = "bl_suit"

/obj/item/clothing/head/helmet/space/hardsuit/nymary
	name = "nymary space helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Built with lightweight materials for extra comfort, but does not protect the eyes from intense light."
	icon_state = "hardsuit0-nymary"
	item_state = "helmet_nymary"
	item_color = "nymary"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	flash_protect = 0
	armor = list(melee = 30, bullet = 5, laser = 10, energy = 5, bomb = 50, bio = 100, rad = 50, fire = 0, acid = 50)
	scan_reagents = 1

/obj/item/clothing/suit/space/hardsuit/nymary
	name = "nymary hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Built with lightweight materials for easier movement."
	icon_state = "hardsuit-nymary"
	item_state = "hardsuit-nymary"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank/internals,/obj/item/weapon/storage/firstaid,/obj/item/device/healthanalyzer,/obj/item/stack/medical)
	armor = list(melee = 30, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 50, fire = 0, acid = 50)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/nymary

//Unathi hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/engine_un
	name = "unathi hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Built with lightweight materials for extra comfort, but does not protect the eyes from intense light."
	icon_state = "hardsuit0-engineering_unathi"
	item_state = "hardsuit0-engineering_unathi"
	item_color = "engineering_unathi"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	flash_protect = 2
	armor = list(melee = 30, bullet = 5, laser = 10, energy = 5, bomb = 50, bio = 100, rad = 50, fire = 50, acid = 75)
	scan_reagents = 1

/obj/item/clothing/suit/space/hardsuit/engine_un
	name = "engineering hardsuit UN"
	desc = "A special suit that protects against hazardous, low pressure environments. Built with lightweight materials for easier movement."
	icon_state = "hardsuit-engineering_unathi"
	item_state = "hardsuit-engineering_unathi"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	armor = list(melee = 30, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 50, fire = 50, acid = 75)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/engine_un

/obj/item/clothing/head/helmet/space/hardsuit/atmos_un
	name = "unathi hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Built with lightweight materials for extra comfort, but does not protect the eyes from intense light."
	icon_state = "hardsuit0-atmos_unathi"
	item_state = "hardsuit0-atmos_unathi"
	item_color = "atmos_unathi"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	flash_protect = 2
	armor = list(melee = 30, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 0, fire = 50, acid = 75)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/atmos_un
	name = "atmos hardsuit UN"
	desc = "A special suit that protects against hazardous, low pressure environments. Built with lightweight materials for easier movement."
	icon_state = "hardsuit-atmos_unathi"
	item_state = "hardsuit-atmos_unathi"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	armor = list(melee = 30, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 0, fire = 50, acid = 75)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_SUIT_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/atmos_un

/obj/item/clothing/head/helmet/space/hardsuit/starcraft
	name = "Power armor helmets"
	desc = "'Задавим их интеллектом!'"
	icon_state = "hardsuit0-marine"
	item_state = "hardsuit0-marine"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	armor = list(melee = 60, bullet = 50, laser = 60, energy = 40, bomb = 40, bio = 100, rad = 100, fire = 100, acid = 60)
	strip_delay = 130
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/suit/space/hardsuit/starcraft
	name = "Power Armor"
	desc = "'Кому навешать?!'"
	icon_state = "hardsuit-marine"
	item_state = "hardsuit-marine"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	armor = list(melee = 80, bullet = 80, laser = 50, energy = 50, bomb = 80, bio = 100, rad = 100, fire = 100, acid = 80)
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/restraints/handcuffs,/obj/item/weapon/tank/internals,/obj/item/weapon/kitchen/knife/combat)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/starcraft
	slowdown = 2
	w_class = 4
	strip_delay = 130
	max_heat_protection_temperature = FIRE_IMMUNITY_SUIT_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF