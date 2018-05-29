/datum/outfit/agent
	name = "Centcom Agent"

	uniform = /obj/item/clothing/under/lawyer/blacksuit
	id = /obj/item/card/id
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/color/black
	belt = /obj/item/storage/belt/holster
	ears = /obj/item/radio/headset/headset_cent/alt
	r_pocket = /obj/item/melee/classic_baton/telescopic
	l_pocket = /obj/item/restraints/handcuffs

/datum/outfit/agent/post_equip(mob/living/carbon/human/H)
	var/obj/item/storage/belt/holster/ready_holster = H.belt
	for(var/obj/item/holster_item in ready_holster)
		qdel(holster_item)
	ready_holster.SendSignal(COMSIG_TRY_STORAGE_INSERT, new /obj/item/gun/ballistic/automatic/pistol, null, TRUE, TRUE)
	ready_holster.SendSignal(COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/m10mm, null, TRUE, TRUE)
	ready_holster.SendSignal(COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/m10mm, null, TRUE, TRUE)

	var/obj/item/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_all_accesses()
	W.access += get_centcom_access("Agent")
	W.assignment = "Agent"
	W.registered_name = H.real_name
	W.update_label()


///////////////////////////
//Экипировка охранника ЦК//
///////////////////////////


/datum/outfit/security_private
	name = "Centcom Security Private - Ember Alert"

	uniform = /obj/item/clothing/under/sec_corporate
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset/headset_cent
	suit = /obj/item/clothing/suit/armor/vest
	head = /obj/item/clothing/head/helmet/sec
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	belt = /obj/item/storage/belt/security/centcome_alert
	suit_store = /obj/item/gun/ballistic/automatic/wt550/mindshield
	back = /obj/item/storage/backpack/security
	backpack_contents = list(/obj/item/storage/box/security/centcom=1,\
		/obj/item/flashlight/seclite=1)
	id = /obj/item/card/id

/datum/outfit/security_private/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_centcom_access("Centcom Security Private")
	W.access += ACCESS_WEAPONS
	W.assignment = "Centcom Security Private"
	W.registered_name = H.real_name
	W.update_label()

	var/obj/item/implant/mindshield/L = new/obj/item/implant/mindshield(H)
	L.implant(H, null, 1)

/datum/outfit/security_private/red
	name = "Centcom Security Private - Red Alert"

	mask = /obj/item/clothing/mask/gas
	suit = /obj/item/clothing/suit/space/hardsuit/space_adv/military
	head = null
	ears = /obj/item/radio/headset/headset_cent/alt
	back = /obj/item/storage/backpack/security
	suit_store = /obj/item/tank/internals/oxygen
	backpack_contents = list(/obj/item/storage/box/security/centcom=1,\
		/obj/item/flashlight/seclite=1,\
		/obj/item/gun/ballistic/automatic/wt550/mindshield=1)


/datum/outfit/security_private/green
	name = "Centcom Security Private - Green Alert"

	ears = /obj/item/radio/headset/headset_cent/alt
	head = null
	uniform = /obj/item/clothing/under/rank/security/navyblue
	suit = null
	belt = /obj/item/storage/belt/security/centcome
	suit_store = null
	backpack_contents = list(/obj/item/storage/box/security/centcom=1,\
		/obj/item/flashlight/seclite=1,\
		/obj/item/gun/energy/e_gun/advtaser=1)

/datum/outfit/security_private/biohazard
	name = "Centcom Security Private - Biohazard"

	ears = /obj/item/radio/headset/headset_cent/alt
	suit = /obj/item/clothing/suit/bio_suit/security
	head = /obj/item/clothing/head/bio_hood/security
	mask = /obj/item/clothing/mask/gas
	suit_store = /obj/item/gun/ballistic/automatic/wt550/mindshield


/////////////////////////////////
//Экипировка сержанта охраны ЦК//
/////////////////////////////////


/datum/outfit/security_sergeant
	name = "Centcom Security Sergeant - Ember Alert"

	uniform = /obj/item/clothing/under/warden_corporate
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset/headset_cent/alt
	suit = /obj/item/clothing/suit/armor/vest
	head = /obj/item/clothing/head/warden/corporate
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	belt = /obj/item/storage/belt/security/centcome_alert
	suit_store = /obj/item/gun/ballistic/automatic/wt550/mindshield
	back = /obj/item/storage/backpack/security
	backpack_contents = list(/obj/item/storage/box/security/centcom=1,\
		/obj/item/shield/riot/tele=1,\
		/obj/item/grenade/barrier=2,\
		/obj/item/flashlight/seclite=1)
	id = /obj/item/card/id

/datum/outfit/security_sergeant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/implant/mindshield/L = new/obj/item/implant/mindshield(H)
	L.implant(H, null, 1)

	var/obj/item/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_centcom_access("Centcom Security Sergeant")
	W.access += ACCESS_WEAPONS
	W.assignment = "Centcom Security Sergeant"
	W.registered_name = H.real_name
	W.update_label()

/datum/outfit/security_sergeant/red
	name = "Centcom Security Sergeant - Red Alert"

	suit = /obj/item/clothing/suit/space/hardsuit/space_adv/swat
	head = null
	ears = /obj/item/radio/headset/headset_cent/alt
	mask = /obj/item/clothing/mask/gas
	glasses = /obj/item/clothing/glasses/thermal
	suit_store = /obj/item/tank/internals/oxygen
	backpack_contents = list(/obj/item/storage/box/security/centcom=1,\
		/obj/item/shield/riot/tele=1,\
		/obj/item/grenade/barrier=2,\
		/obj/item/flashlight/seclite=1,\
		/obj/item/gun/ballistic/automatic/wt550/mindshield=1)

/datum/outfit/security_sergeant/green
	name = "Centcom Security Sergeant - Green Alert"

	uniform = /obj/item/clothing/under/rank/warden/navyblue
	suit = null
	head = /obj/item/clothing/head/beret/sec/navywarden
	suit_store = null
	belt = /obj/item/storage/belt/security/centcome
	backpack_contents = list(/obj/item/storage/box/security/centcom=1,\
		/obj/item/shield/riot/tele=1,\
		/obj/item/grenade/barrier=2,\
		/obj/item/flashlight/seclite=1,\
		/obj/item/gun/energy/e_gun/advtaser=1)

/datum/outfit/security_sergeant/biohazard
	name = "Centcom Security Sergeant - Biohazard"

	suit = /obj/item/clothing/suit/bio_suit/security
	head = /obj/item/clothing/head/bio_hood/security
	mask = /obj/item/clothing/mask/gas


//////////////////////////
//Экипировка спецназа ЦК//
//////////////////////////


/datum/outfit/combat
	name = "Special Force"

	uniform = /obj/item/clothing/under/syndicate/camo/urban
	shoes = /obj/item/clothing/shoes/combat
	suit = /obj/item/clothing/suit/armor/combat_heavy
	suit_store = /obj/item/gun/ballistic/automatic/ar
	mask = /obj/item/clothing/mask/gas/mercenaries
	head = /obj/item/clothing/head/helmet/combat_heavy
	belt = /obj/item/storage/belt/military/assault/special_force
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	ears = /obj/item/radio/headset/headset_cent/alt
	gloves = /obj/item/clothing/gloves/combat
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/ammo_box/magazine/m556
	id = /obj/item/card/id
	back = /obj/item/storage/backpack/security
	backpack_contents = list(/obj/item/storage/box/security/centcom=1,\
		/obj/item/grenade/plastic/c4=3,\
		/obj/item/kitchen/knife/combat=1)

/datum/outfit/combat/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/implant/mindshield/L = new/obj/item/implant/mindshield(H)
	L.implant(H, null, 1)

	var/obj/item/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_all_accesses()
	W.access += get_centcom_access("Admiral")
	W.assignment = "Squad Alpha"
	W.registered_name = H.real_name
	W.update_label()
