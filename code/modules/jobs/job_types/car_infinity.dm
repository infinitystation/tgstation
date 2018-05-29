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

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_MAINT_TUNNELS, ACCESS_CONSTRUCTION, ACCESS_HEADS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_MAINT_TUNNELS, ACCESS_CONSTRUCTION, ACCESS_HEADS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY)

/datum/outfit/job/ifa
	name = "Internal Affairs Agent"

	id = /obj/item/card/id/silver
	belt = /obj/item/pda/heads
	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/radio/headset/headset_ifa
	uniform = /obj/item/clothing/under/suit_jacket/charcoal
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	shoes = /obj/item/clothing/shoes/laceup
	l_hand = /obj/item/storage/secure/briefcase
	l_pocket = /obj/item/melee/baton/shocker/loaded

	implants = list(/obj/item/implant/mindshield)

/obj/item/radio/headset/headset_ifa
	name = "internal affairs agent's radio headset"
	desc = "A headset with a commanding and security channel. \nTo access the security channel, use :s. For command, use :c."
	icon_state = "com_headset"
	item_state = "headset"
	keyslot = new /obj/item/encryptionkey/ifa

/obj/item/encryptionkey/ifa
	name = "\proper the internal affairs agent's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :c - command, :s - security."
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1)



