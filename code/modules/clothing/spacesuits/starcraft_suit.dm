/obj/item/clothing/head/helmet/space/hardsuit/space_adv/starcraft
	name = "Power armor helmets"
	desc = "'Задавим их интеллектом!'"
	icon = 'icons/obj/starcraft.dmi'
	worn_icon = 'icons/obj/starcraft.dmi'
	icon_state = "helmet"
	armor = list(melee = 60, bullet = 50, laser = 60, energy = 40, bomb = 90, bio = 100, rad = 100)
	flags = BLOCKHAIR | STOPSPRESSUREDMAGE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/space_adv/starcraft
	name = "Power Armor"
	desc = "'Кому навешать?!'"
	icon = 'icons/obj/starcraft.dmi'
	icon_state = "StarCraft"
	worn_icon = 'icons/obj/starcraft.dmi'
	armor = list(melee = 60, bullet = 80, laser = 60, energy = 40, bomb = 90, bio = 100, rad = 100)
	allowed = list(/obj/item/weapon/gun,/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/weapon/melee/baton)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/space_adv/starcraft
	slowdown = 2
	w_class = 4
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT