/obj/item/clothing/suit/space/bobafett_suit
	name = "bobafett suit"
	desc = "A long time ago..."
	icon_state = "bobafett_suit"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	armor = list(melee = 30, bullet = 30, laser = 30,energy = 30, bomb = 30, bio = 20, rad = 10)
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
	armor = list(melee = 30, bullet = 5, laser = 10, energy = 5, bomb = 50, bio = 100, rad = 50)
	scan_reagents = 1

/obj/item/clothing/suit/space/hardsuit/nymary
	name = "nymary hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Built with lightweight materials for easier movement."
	icon_state = "hardsuit-nymary"
	item_state = "hardsuit-nymary"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank/internals,/obj/item/weapon/storage/firstaid,/obj/item/device/healthanalyzer,/obj/item/stack/medical)
	armor = list(melee = 30, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 50)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/nymary