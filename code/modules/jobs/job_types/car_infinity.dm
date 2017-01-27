//Не обращайте внимание на название файла. Это сделано для упорядочивания списка работ
/datum/job/ifa
	title = "Internal Affairs Agent"
	flag = IFA
	department_head = list("Centcom")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Представителям Нанотрайзен и Космическому Закону"
	selection_color = "#dddddd"
	req_admin_notify = 1
	minimal_player_age = 30

	outfit = /datum/outfit/job/ifa

	access = list(access_security, access_sec_doors, access_brig, access_maint_tunnels, access_construction, access_heads, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_maint_tunnels, access_construction, access_heads, access_RC_announce, access_keycard_auth, access_gateway)

/datum/outfit/job/ifa
	name = "Internal Affairs Agent"

	id = /obj/item/weapon/card/id/silver
	belt = /obj/item/device/pda/heads
	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/device/radio/headset/headset_ifa
	uniform = /obj/item/clothing/under/suit_jacket/charcoal
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	shoes = /obj/item/clothing/shoes/laceup
	l_hand = /obj/item/weapon/storage/secure/briefcase
	l_pocket = /obj/item/weapon/melee/baton/shocker/loaded

	implants = list(/obj/item/weapon/implant/mindshield)

/obj/item/device/radio/headset/headset_ifa
	name = "internal affairs agent's radio headset"
	desc = "A headset with a commanding and security channel. \nTo access the security channel, use :s. For command, use :c."
	icon_state = "com_headset"
	item_state = "headset"
	keyslot = new /obj/item/device/encryptionkey/ifa

/obj/item/device/encryptionkey/ifa
	name = "\proper the internal affairs agent's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :c - command, :s - security."
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1)



