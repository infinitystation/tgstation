/datum/outfit/agent
	name = "Centcom Agent"

	uniform = /obj/item/clothing/under/lawyer/blacksuit
	id = /obj/item/weapon/card/id
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/color/black
	belt = /obj/item/weapon/storage/belt/holster
	ears = /obj/item/device/radio/headset/headset_cent/alt
	r_pocket = /obj/item/weapon/melee/classic_baton/telescopic
	l_pocket = /obj/item/weapon/restraints/handcuffs

/datum/outfit/agent/post_equip(mob/living/carbon/human/H)
	var/obj/item/weapon/storage/belt/holster/ready_holster = H.belt
	for(var/obj/item/holster_item in ready_holster)
		qdel(holster_item)
	for(var/i=1, i>0, i--)
		ready_holster.handle_item_insertion(new /obj/item/weapon/gun/projectile/automatic/pistol,1)
	ready_holster.handle_item_insertion(new /obj/item/ammo_box/magazine/m10mm,1)
	ready_holster.handle_item_insertion(new /obj/item/ammo_box/magazine/m10mm,1)

	var/obj/item/weapon/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_all_accesses()
	W.access += get_centcom_access("Agent")
	W.assignment = "Agent"
	W.registered_name = H.real_name
	W.update_label()

/datum/outfit/security_private
	name = "Centcom Securty Private"

	uniform = /obj/item/clothing/under/sec_corporate
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/device/radio/headset/headset_cent
	suit = /obj/item/clothing/suit/armor/vest
	head = /obj/item/clothing/head/helmet/sec
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	belt = /obj/item/weapon/gun/projectile/automatic/proto/mindshield
	l_pocket = /obj/item/ammo_box/magazine/smgm9mm
	back = /obj/item/weapon/storage/backpack/security
	backpack_contents = list(/obj/item/weapon/storage/box/security/centcom=1,\
		/obj/item/weapon/melee/baton/loaded=1,\
		/obj/item/weapon/restraints/handcuffs=2,\
		/obj/item/weapon/grenade/flashbang=1,\
		/obj/item/device/flashlight=1)
	r_pocket = /obj/item/ammo_box/magazine/smgm9mm
	id = /obj/item/weapon/card/id

/datum/outfit/security_private/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/weapon/implant/mindshield/L = new/obj/item/weapon/implant/mindshield(H)
	L.imp_in = H
	L.implanted = 1
	H.sec_hud_set_implants()

	var/obj/item/weapon/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_centcom_access("Centcom Securty Private")
	W.access += access_weapons
	W.assignment = "Centcom Securty Private"
	W.registered_name = H.real_name
	W.update_label()

/datum/outfit/security_sergeant
	name = "Centcom Securty Sergeant"

	uniform = /obj/item/clothing/under/warden_corporate
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/device/radio/headset/headset_cent
	suit = /obj/item/clothing/suit/armor/vest
	head = /obj/item/clothing/head/warden/corporate
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	belt = /obj/item/weapon/gun/projectile/automatic/proto/mindshield
	l_pocket = /obj/item/ammo_box/magazine/smgm9mm
	back = /obj/item/weapon/storage/backpack/security
	backpack_contents = list(/obj/item/weapon/storage/box/security/centcom=1,\
		/obj/item/weapon/melee/baton/loaded=1,\
		/obj/item/weapon/restraints/handcuffs=2,\
		/obj/item/weapon/grenade/flashbang=1,\
		/obj/item/weapon/shield/riot/tele=1,\
		/obj/item/weapon/grenade/barrier=2,\
		/obj/item/device/flashlight=1)
	r_pocket = /obj/item/ammo_box/magazine/smgm9mm
	id = /obj/item/weapon/card/id

/datum/outfit/security_sergeant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/weapon/implant/mindshield/L = new/obj/item/weapon/implant/mindshield(H)
	L.imp_in = H
	L.implanted = 1
	H.sec_hud_set_implants()

	var/obj/item/weapon/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_centcom_access("Centcom Securty Sergeant")
	W.access += access_weapons
	W.assignment = "Centcom Securty Sergeant"
	W.registered_name = H.real_name
	W.update_label()

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
	uniform = /obj/item/clothing/under/uac
	suit = /obj/item/clothing/suit/armor/uac
	shoes = /obj/item/clothing/shoes/combat/uac
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/trooper
	id = /obj/item/weapon/card/id
	glasses = /obj/item/clothing/glasses/night
	mask = /obj/item/clothing/mask/breath
	belt = /obj/item/ammo_box/magazine/a646
	l_pocket = /obj/item/weapon/tank/internals/emergency_oxygen
	r_pocket = /obj/item/ammo_box/magazine/a646
	r_hand = /obj/item/weapon/gun/projectile/automatic/mg88

/datum/outfit/trooper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/weapon/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access += list(access_maint_tunnels, access_syndicate)
	W.assignment = "Trooper"
	W.registered_name = H.real_name
	W.update_label()