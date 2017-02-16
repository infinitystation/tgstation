/datum/outfit/jason_voorhees
	name = "Jason Voorhees"

	suit = /obj/item/clothing/suit/toggle/brown_jacket
	mask = /obj/item/clothing/mask/gas/mime
	r_hand = /obj/item/weapon/kitchen/knife/combat

/datum/outfit/michael_myers
	name = "Michael Myers"

	mask = /obj/item/clothing/mask/gas/mime
	r_hand = /obj/item/weapon/kitchen/knife

/datum/outfit/nar_cult
	name = "Nar-sie's cultist"

	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/cult/alt
	suit = /obj/item/clothing/suit/cultrobes/alt
	head = /obj/item/clothing/head/culthood/alt
	l_pocket = /obj/item/weapon/tome
	r_pocket = /obj/item/weapon/paper/talisman
	back = /obj/item/weapon/storage/backpack/cultpack
	suit_store = /obj/item/weapon/melee/cultblade

/datum/outfit/abductor_agent
	name = "Abductor Agent"

	uniform = /obj/item/clothing/under/color/grey
	shoes = /obj/item/clothing/shoes/combat
	suit = /obj/item/clothing/suit/armor/abductor/vest/combat
	suit_store = /obj/item/weapon/gun/energy/alien/base
	head = /obj/item/clothing/head/helmet/abductor
	belt = /obj/item/weapon/storage/belt/military/abductor/full
	l_pocket = /obj/item/device/flashlight/slime
	back = /obj/item/weapon/storage/backpack
	backpack_contents = list(/obj/item/weapon/abductor_baton=1,\
		/obj/item/device/abductor/silencer=1)

/datum/outfit/clock_cult
	name = "Ratvar's cultist"

	uniform = /obj/item/clothing/under/color/orange
	shoes = /obj/item/clothing/shoes/clockwork
	suit = /obj/item/clothing/suit/armor/clockwork
	head = /obj/item/clothing/head/helmet/clockwork
	gloves = /obj/item/clothing/gloves/clockwork
	l_pocket = /obj/item/clockwork/slab/starter
	r_pocket = /obj/item/weapon/nullrod/tribal_knife
	back = /obj/item/weapon/storage/backpack/satchel

/datum/outfit/trooper
	name = "UAC Trooper"

	ears = /obj/item/device/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/uac
	suit = /obj/item/clothing/suit/armor/uac
	shoes = /obj/item/clothing/shoes/combat/swat/uac
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/uac
	id = /obj/item/weapon/card/id
	glasses = /obj/item/clothing/glasses/night
	mask = /obj/item/clothing/mask/breath
	belt = /obj/item/ammo_box/magazine/a646
	l_pocket = /obj/item/weapon/tank/internals/emergency_oxygen
	r_pocket = /obj/item/ammo_box/magazine/a646
	r_hand = /obj/item/weapon/gun/ballistic/automatic/mg88

/datum/outfit/trooper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/weapon/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access += list(access_maint_tunnels, access_syndicate)
	W.assignment = "Trooper"
	W.registered_name = H.real_name
	W.update_label()

/datum/outfit/survivor
	name = "Survivor"

	uniform = /obj/item/clothing/under/color/brown
	shoes = /obj/item/clothing/shoes/workboots/mining
	suit = /obj/item/clothing/suit/hooded/explorer
	suit_store = /obj/item/weapon/tank/internals/oxygen
	mask = /obj/item/clothing/mask/gas/explorer
	belt = /obj/item/weapon/storage/belt/utility/full
	glasses = /obj/item/clothing/glasses/welding
	ears = /obj/item/device/radio/headset
	gloves = /obj/item/clothing/gloves/combat
	l_pocket = /obj/item/device/flashlight/seclite
	r_pocket = /obj/item/weapon/extinguisher/mini
	back = /obj/item/weapon/storage/backpack/explorer
	backpack_contents = list(/obj/item/weapon/gun/energy/kinetic_accelerator=1,\
		/obj/item/weapon/storage/bag/ore=2,\
		/obj/item/device/t_scanner/adv_mining_scanner/lesser=1,\
		/obj/item/clothing/glasses/meson =1,\
		/obj/item/weapon/kitchen/knife/combat/survival=1)
	id = /obj/item/weapon/card/id

/datum/outfit/survivor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/weapon/card/id/W = H.wear_id
	W.icon_state = "data"
	W.access = get_all_accesses()
	W.access += get_centcom_access("Admiral")
	W.assignment = "Survivor"
	W.registered_name = H.real_name
	W.update_label()

/datum/outfit/dwarf
	name = "Dwarf"

	uniform = /obj/item/clothing/under/color/random
	shoes = /obj/item/clothing/shoes/sandal
	back = /obj/item/weapon/storage/backpack/explorer