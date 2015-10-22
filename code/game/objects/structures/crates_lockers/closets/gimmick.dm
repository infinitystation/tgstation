/obj/structure/closet/cabinet
	name = "cabinet"
	desc = "Old will forever be in fashion."
	icon_state = "cabinet"
	burn_state = 0 //Burnable
	burntime = 20

/obj/structure/closet/acloset
	name = "strange closet"
	desc = "It looks alien!"
	icon_state = "alien"


/obj/structure/closet/gimmick
	name = "administrative supply closet"
	desc = "It's a storage unit for things that have no right being here."
	icon_state = "syndicate"

/obj/structure/closet/gimmick/starcraft
	name = "Marine closet"
	desc = "Good luck"
	icon_state = "tac"

/obj/structure/closet/gimmick/starcraft/New()
	..()
	new /obj/item/clothing/under/syndicate/tacticool(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/clothing/suit/space/hardsuit/space_adv/starcraft(src)
	new /obj/item/weapon/reagent_containers/hypospray/medipen/stimpack(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/weapon/gun/projectile/automatic/gause(src)
	new /obj/item/ammo_box/magazine/spine(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/weapon/tank/jetpack/oxygen/harness(src)
	new /obj/item/device/radio/headset/syndicate/alt(src)


/obj/structure/closet/gimmick/corporate/sec
	name = "Corporate security closet"
	icon_state = "tac"

/obj/structure/closet/gimmick/corporate/sec/New()
	..()
	new /obj/item/clothing/under/sec_corporate(src)
	new /obj/item/weapon/gun/energy/gun(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/device/radio/headset/syndicate(src)
	new	/obj/item/clothing/glasses/sunglasses(src)

/obj/structure/closet/gimmick/corporate/sec/full
	name = "Corporate security armory closet"

/obj/structure/closet/gimmick/corporate/sec/full/New()
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/weapon/stock_parts/cell/ammo(src)
	new /obj/item/stack/medical/bruise_pack(src)


/obj/structure/closet/gimmick/zombie
	name = "For light live"
	desc = "Good luck."

/obj/structure/closet/gimmick/zombie/New()
	..()
	new /obj/item/clothing/under/color/black(src)
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/device/radio(src)
	new /obj/item/weapon/gun/energy/laser(src)
	new /obj/item/clothing/head/helmet/swat(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/weapon/reagent_containers/pill/lowcharcoal(src)
	new /obj/item/weapon/card/id/syndicate(src)


/obj/structure/closet/gimmick/russian
	name = "russian surplus closet"
	desc = "It's a storage unit for Russian standard-issue surplus."

/obj/structure/closet/gimmick/russian/New()
	..()
	new /obj/item/clothing/head/ushanka(src)
	new /obj/item/clothing/head/ushanka(src)
	new /obj/item/clothing/head/ushanka(src)
	new /obj/item/clothing/head/ushanka(src)
	new /obj/item/clothing/head/ushanka(src)
	new /obj/item/clothing/under/soviet(src)
	new /obj/item/clothing/under/soviet(src)
	new /obj/item/clothing/under/soviet(src)
	new /obj/item/clothing/under/soviet(src)
	new /obj/item/clothing/under/soviet(src)

/obj/structure/closet/gimmick/tacticool
	name = "tacticool gear closet"
	desc = "It's a storage unit for Tacticool gear."
	anchored = 1

/obj/structure/closet/gimmick/tacticool/New()
	..()
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/head/helmet/tact(src)
	new /obj/item/clothing/head/helmet/tact(src)
	new /obj/item/clothing/mask/gas/sechailer/swat(src)
	new /obj/item/clothing/mask/gas/sechailer/swat(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/clothing/suit/armor/tacticool(src)
	new /obj/item/clothing/suit/armor/tacticool(src)
	new /obj/item/clothing/under/syndicate/tacticool(src)
	new /obj/item/clothing/under/syndicate/tacticool(src)
	new /obj/item/weapon/gun/projectile/automatic/ar(src)
	new /obj/item/weapon/gun/projectile/automatic/ar(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/device/flashlight/seclite(src)
	new /obj/item/device/flashlight/seclite(src)
	new /obj/item/device/radio(src)
	new /obj/item/device/radio(src)

/obj/structure/closet/gimmick/event/diablo/survivor
	name = "Survivors gear closet"
	desc = "It's a storage unit for survivors. Good luck."
	anchored = 1

/obj/structure/closet/gimmick/event/diablo/survivor/New()
	..()
	new /obj/item/clothing/suit/space/hardsuit/engine(src)
	new /obj/item/clothing/suit/space/hardsuit/medical(src)
	new /obj/item/clothing/suit/space/hardsuit/engine/atmos(src)
	new /obj/item/weapon/tank/internals/oxygen(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/weapon/gun/energy/gun/nuclear(src)
	new /obj/item/weapon/pickaxe/drill(src)
	new /obj/item/weapon/storage/toolbox/mechanical(src)
	new /obj/item/clothing/under/rank/chaplain(src)
	new /obj/item/clothing/shoes/sneakers/syndigaloshes(src)
	new /obj/item/weapon/gun/energy/gun/nuclear(src)
	new /obj/item/weapon/gun/energy/gun/nuclear(src)
	new /obj/item/weapon/pickaxe/drill(src)
	new /obj/item/weapon/pickaxe/drill(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/weapon/tank/internals/oxygen(src)
	new /obj/item/weapon/tank/internals/oxygen(src)

/obj/structure/closet/gimmick/event/diablo/diavol
	name = "Diablo gear closet"
	desc = "It's a storage unit for dark lord. Let's kill them all!."
	anchored = 1

/obj/structure/closet/gimmick/event/diablo/diavol/New()
	..()
	new /obj/item/weapon/gun/energy/kinetic_accelerator/crossbow(src)
	new /obj/item/weapon/reagent_containers/hypospray/combat/nanites(src)
	new /obj/item/clothing/mask/gas/voice(src)

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
	new /obj/item/clothing/suit/armor/tdome/red(src)
	new /obj/item/clothing/suit/armor/tdome/red(src)
	new /obj/item/clothing/suit/armor/tdome/red(src)
	new /obj/item/weapon/melee/energy/sword/saber(src)
	new /obj/item/weapon/melee/energy/sword/saber(src)
	new /obj/item/weapon/melee/energy/sword/saber(src)
	new /obj/item/weapon/gun/energy/laser(src)
	new /obj/item/weapon/gun/energy/laser(src)
	new /obj/item/weapon/gun/energy/laser(src)
	new /obj/item/weapon/melee/baton/loaded(src)
	new /obj/item/weapon/melee/baton/loaded(src)
	new /obj/item/weapon/melee/baton/loaded(src)
	new /obj/item/weapon/storage/box/flashbangs(src)
	new /obj/item/weapon/storage/box/flashbangs(src)
	new /obj/item/weapon/storage/box/flashbangs(src)
	new /obj/item/clothing/head/helmet/thunderdome(src)
	new /obj/item/clothing/head/helmet/thunderdome(src)
	new /obj/item/clothing/head/helmet/thunderdome(src)

/obj/structure/closet/thunderdome/tdgreen
	name = "green-team Thunderdome closet"
	icon_door = "green"

/obj/structure/closet/thunderdome/tdgreen/New()
	..()
	new /obj/item/clothing/suit/armor/tdome/green(src)
	new /obj/item/clothing/suit/armor/tdome/green(src)
	new /obj/item/clothing/suit/armor/tdome/green(src)
	new /obj/item/weapon/melee/energy/sword/saber(src)
	new /obj/item/weapon/melee/energy/sword/saber(src)
	new /obj/item/weapon/melee/energy/sword/saber(src)
	new /obj/item/weapon/gun/energy/laser(src)
	new /obj/item/weapon/gun/energy/laser(src)
	new /obj/item/weapon/gun/energy/laser(src)
	new /obj/item/weapon/melee/baton/loaded(src)
	new /obj/item/weapon/melee/baton/loaded(src)
	new /obj/item/weapon/melee/baton/loaded(src)
	new /obj/item/weapon/storage/box/flashbangs(src)
	new /obj/item/weapon/storage/box/flashbangs(src)
	new /obj/item/weapon/storage/box/flashbangs(src)
	new /obj/item/clothing/head/helmet/thunderdome(src)
	new /obj/item/clothing/head/helmet/thunderdome(src)
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
	new /obj/item/clothing/shoes/combat/swat(src)

/obj/structure/closet/gimmick/uac/trooper
	name = "UAC Paratrooper equipment"
	desc = "It's a storage unit for operational gear."
	icon_state = "syndicate"

/obj/structure/closet/gimmick/uac/trooper/New()
	..()
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/head/helmet/TrooperHelmet(src)
	new /obj/item/clothing/mask/gas/sechailer/swat(src)
	new /obj/item/clothing/suit/armor/UACtrooperArmor(src)
	new /obj/item/weapon/gun/projectile/automatic/mg88(src)
	new /obj/item/ammo_box/magazine/a646(src)
	new /obj/item/ammo_box/magazine/a646(src)
	new /obj/item/device/flashlight/seclite(src)
	new /obj/item/device/radio(src)
	new /obj/item/clothing/gloves/combat(src)

/obj/structure/closet/gimmick/MEAT_GRINDER
	name = "WAR!"
	desc = "BLOOD FOR GOD OF BLOOD! KILL THEM ALL!"
	icon_state = "syndicate"

/obj/structure/closet/gimmick/MEAT_GRINDER/New()
	..()
	new /obj/item/weapon/gun/projectile/automatic/ar(src)
	new /obj/item/weapon/gun/projectile/automatic/ar(src)
	new /obj/item/weapon/gun/projectile/automatic/ar(src)
	new /obj/item/weapon/gun/projectile/automatic/ar(src)
	new /obj/item/weapon/gun/projectile/automatic/ar(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/clothing/under/syndicate(src)
	new /obj/item/clothing/under/syndicate(src)
	new /obj/item/clothing/under/syndicate(src)
	new /obj/item/clothing/under/syndicate(src)
	new /obj/item/clothing/under/syndicate(src)
	new /obj/item/clothing/head/helmet/swat(src)
	new /obj/item/clothing/head/helmet/swat(src)
	new /obj/item/clothing/head/helmet/swat(src)
	new /obj/item/clothing/head/helmet/swat(src)
	new /obj/item/clothing/head/helmet/swat(src)
	new /obj/item/device/radio/headset(src)
	new /obj/item/device/radio/headset(src)
	new /obj/item/device/radio/headset(src)
	new /obj/item/device/radio/headset(src)
	new /obj/item/device/radio/headset(src)