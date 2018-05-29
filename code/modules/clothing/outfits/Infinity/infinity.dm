/datum/outfit/jason_voorhees
	name = "Jason Voorhees"

	suit = /obj/item/clothing/suit/toggle/brown_jacket
	mask = /obj/item/clothing/mask/gas/mime
	r_hand = /obj/item/kitchen/knife/combat

/datum/outfit/michael_myers
	name = "Michael Myers"

	mask = /obj/item/clothing/mask/gas/mime
	r_hand = /obj/item/kitchen/knife

/datum/outfit/nar_cult
	name = "Nar-sie's cultist"

	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/cult/alt
	suit = /obj/item/clothing/suit/cultrobes/alt
	head = /obj/item/clothing/head/culthood/alt
	l_pocket = /obj/item/tome
	back = /obj/item/storage/backpack/cultpack
	suit_store = /obj/item/melee/cultblade

/datum/outfit/abductor_agent
	name = "Abductor Agent"

	uniform = /obj/item/clothing/under/color/grey
	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/helmet/abductor
	belt = /obj/item/storage/belt/military/abductor/full
	l_pocket = /obj/item/flashlight/slime
	back = /obj/item/storage/backpack
	backpack_contents = list(/obj/item/abductor_baton=1,\
		/obj/item/abductor/silencer=1)

/datum/outfit/clock_cult
	name = "Ratvar's cultist"

	uniform = /obj/item/clothing/under/color/orange
	shoes = /obj/item/clothing/shoes/clockwork
	suit = /obj/item/clothing/suit/armor/clockwork
	head = /obj/item/clothing/head/helmet/clockwork
	gloves = /obj/item/clothing/gloves/clockwork

/datum/outfit/trooper
	name = "UAC Trooper"

	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/uac
	suit = /obj/item/clothing/suit/armor/uac
	shoes = /obj/item/clothing/shoes/combat/swat/uac
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/uac
	id = /obj/item/card/id
	glasses = /obj/item/clothing/glasses/night
	mask = /obj/item/clothing/mask/breath
	belt = /obj/item/ammo_box/magazine/a646
	l_pocket = /obj/item/tank/internals/emergency_oxygen
	r_pocket = /obj/item/ammo_box/magazine/a646
	r_hand = /obj/item/gun/ballistic/automatic/mg88

/datum/outfit/trooper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access += list(ACCESS_MAINT_TUNNELS, ACCESS_SYNDICATE)
	W.assignment = "Trooper"
	W.registered_name = H.real_name
	W.update_label()

/datum/outfit/survivor
	name = "Survivor"

	uniform = /obj/item/clothing/under/color/brown
	shoes = /obj/item/clothing/shoes/workboots/mining
	suit = /obj/item/clothing/suit/hooded/explorer
	suit_store = /obj/item/tank/internals/oxygen
	mask = /obj/item/clothing/mask/gas/explorer
	belt = /obj/item/storage/belt/utility/full
	glasses = /obj/item/clothing/glasses/welding
	ears = /obj/item/radio/headset
	gloves = /obj/item/clothing/gloves/combat
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/extinguisher/mini
	back = /obj/item/storage/backpack/explorer
	backpack_contents = list(/obj/item/gun/energy/kinetic_accelerator=1,\
		/obj/item/storage/bag/ore=2,\
		/obj/item/t_scanner/adv_mining_scanner/lesser=1,\
		/obj/item/clothing/glasses/meson =1,\
		/obj/item/kitchen/knife/combat/survival=1)
	id = /obj/item/card/id

/datum/outfit/survivor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
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
	back = /obj/item/storage/backpack/explorer