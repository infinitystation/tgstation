/obj/structure/closet/cabinet
	name = "cabinet"
	desc = "Old will forever be in fashion."
	icon_state = "cabinet"
	resistance_flags = FLAMMABLE
	obj_integrity = 70
	max_integrity = 70

/obj/structure/closet/acloset
	name = "strange closet"
	desc = "It looks alien!"
	icon_state = "alien"


/obj/structure/closet/gimmick
	name = "administrative supply closet"
	desc = "It's a storage unit for things that have no right being here."
	icon_state = "syndicate"

/obj/structure/closet/gimmick/russian
	name = "russian surplus closet"
	desc = "It's a storage unit for Russian standard-issue surplus."

/obj/structure/closet/gimmick/russian/New()
	..()
	for(var/i in 1 to 5)
		new /obj/item/clothing/head/ushanka(src)
	for(var/i in 1 to 5)
		new /obj/item/clothing/under/soviet(src)

/obj/structure/closet/thunderdome
	name = "\improper Thunderdome closet"
	desc = "Everything you need!"
	anchored = 1

/obj/structure/closet/thunderdome
	name = "\improper Thunderdome closet"
	desc = "Everything you need!"
	anchored = 1

/obj/structure/closet/thunderdome/tdred
	name = "red-team Thunderdome closet"
	icon_door = "red"

/obj/structure/closet/thunderdome/tdred/New()
	..()
	for(var/i in 1 to 3)
		new /obj/item/clothing/suit/armor/tdome/red(src)
	for(var/i in 1 to 3)
		new /obj/item/weapon/melee/energy/sword/saber(src)
	for(var/i in 1 to 3)
		new /obj/item/weapon/gun/energy/laser(src)
	for(var/i in 1 to 3)
		new /obj/item/weapon/melee/baton/loaded(src)
	for(var/i in 1 to 3)
		new /obj/item/weapon/storage/box/flashbangs(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/head/helmet/thunderdome(src)

/obj/structure/closet/thunderdome/tdgreen
	name = "green-team Thunderdome closet"
	icon_door = "green"

/obj/structure/closet/thunderdome/tdgreen/New()
	..()
	for(var/i in 1 to 3)
		new /obj/item/clothing/suit/armor/tdome/green(src)
	for(var/i in 1 to 3)
		new /obj/item/weapon/melee/energy/sword/saber(src)
	for(var/i in 1 to 3)
		new /obj/item/weapon/gun/energy/laser(src)
	for(var/i in 1 to 3)
		new /obj/item/weapon/melee/baton/loaded(src)
	for(var/i in 1 to 3)
		new /obj/item/weapon/storage/box/flashbangs(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/head/helmet/thunderdome(src)

/obj/structure/closet/malf/suits
	desc = "It's a storage unit for operational gear."
	icon_state = "syndicate"

/obj/structure/closet/malf/suits/New()
	..()
	new /obj/item/weapon/tank/jetpack/void(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/clothing/head/helmet/space/nasavoid(src)
	new /obj/item/clothing/suit/space/nasavoid(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/stock_parts/cell(src)
	new /obj/item/device/multitool(src)

/obj/structure/closet/gimmick/uac
	name = "UAC Paratrooper clothing"
	desc = "It's a storage unit for clothing."
	icon_state = "syndicate"

/obj/structure/closet/gimmick/uac/New()
	..()
	new /obj/item/clothing/under/pants/camo(src)
	new /obj/item/clothing/shoes/combat/swat/uac(src)

/obj/structure/closet/gimmick/uac/trooper
	name = "Paratrooper equipment"
	desc = "It's a storage unit for operational gear."
	icon_state = "syndicate"

/obj/structure/closet/gimmick/uac/trooper/New()
	..()
	new /obj/item/clothing/under/syndicate/uac(src)
	new /obj/item/clothing/shoes/combat/swat/uac(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/clothing/suit/armor/uac(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new	/obj/item/device/radio/headset/syndicate/alt(src)
	new /obj/item/clothing/head/helmet/uac(src)
	new /obj/item/weapon/gun/ballistic/automatic/mg88(src)
	new /obj/item/ammo_box/magazine/a646(src)
	new /obj/item/ammo_box/magazine/a646(src)
	new /obj/item/device/flashlight/seclite(src)
	new /obj/item/weapon/storage/backpack/satchel(src)

/obj/structure/closet/gimmick/uac/trooper/lab
	name = "Paratrooper equipment"
	desc = "It's a storage unit for operational gear."
	icon_state = "syndicate"

/obj/structure/closet/gimmick/uac/trooper/lab/New()
	..()
	new /obj/item/clothing/under/syndicate/uac(src)
	new /obj/item/clothing/shoes/combat/swat/uac(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/clothing/suit/armor/uac(src)
	new	/obj/item/device/radio/headset(src)
	new /obj/item/clothing/head/helmet/uac(src)

/obj/structure/closet/gimmick/zombie
	name = "uao"
	desc = "It's a storage unit for operational gear."
	icon_state = "syndicate"