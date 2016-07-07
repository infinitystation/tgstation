/datum/outfit/agent
	name = "Centcom Agent"

	uniform = /obj/item/clothing/under/lawyer/blacksuit
	id = /obj/item/weapon/card/id
	suit = /obj/item/clothing/suit/storage/toggle/lawyer/black
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