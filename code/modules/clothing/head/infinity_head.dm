/obj/item/clothing/head/bowknot
	name = "red bow-knot"
	desc = "A simple red bow."
	icon_state = "bow_knot"
	item_state = "helmet"
	item_color = "bow_knot"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/plast_helmet
	name = "plast helmet"
	desc = "Some unusual helmet."
	icon_state = "plast_helmet"
	item_state = "helmet"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	armor = list(melee = 25, bullet = 25, laser = 30,energy = 25, bomb = 10, bio = 15, rad = 0, fire = 60, acid = 50)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	flags = STOPSPRESSUREDMAGE
	strip_delay = 80
	flags_inv = HIDEEARS|HIDEEYES|HEADCOVERSMOUTH|HIDEHAIR
	flags_cover = HEADCOVERSEYES
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/blue_ny_hat
	name = "blue New Year hat"
	desc = "Ho ho ho!"
	icon_state = "blue_ny_hat"
	item_state = "helmet"
	item_color = "blue_ny_hat"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/helmet/space/bobafett_head
	name = "boba fett helmet"
	desc = "...In a Galaxy far far away."
	icon_state = "bobafett_head"
	item_state = "helmet"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	flags_inv = HIDEHAIR
	flags = STOPSPRESSUREDMAGE|THICKMATERIAL
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	armor = list(melee = 25, bullet = 25, laser = 30,energy = 25, bomb = 10, bio = 15, rad = 15, fire = 50, acid = 50)

/obj/item/clothing/head/captoe
	name = "cap toe hat"
	desc = "Soft and worn hat."
	icon_state = "cap_toe"
	item_state = ""
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/captoe/black
	name = "black cap toe hat"
	desc = "Soft and worn hat."
	icon_state = "bcap_toe"
	item_state = ""
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/beret/sec/corporate
	name = "corporate beret"
	desc = "A robust beret with the security insignia emblazoned on it. Uses reinforced fabric to offer sufficent protection."
	icon_state = "sec_corporateb"
	item_state = ""
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/HoS/beret/corporate
	name = "head of security corporate beret"
	desc = "A robust beret with the security insignia emblazoned on it. Uses reinforced fabric to offer sufficent protection."
	icon_state = "hos_corporateb"
	item_state = ""
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/warden/corporate
	name = "warden corporate beret"
	desc = "A robust beret with the security insignia emblazoned on it. Uses reinforced fabric to offer sufficent protection."
	icon_state = "warden_corporateb"
	item_state = ""
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/veil
	name = "veil"
	desc = "Light and clear headdress. Speccialy for wedding."
	icon_state = "veil"
	item_state = ""
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/lify_hat
	name = "lify hat"
	desc = "Especially for cosplay."
	icon_state = "lify_hat"
	item_state = ""
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/beret/centcom/captain
	name = "centcom captain beret"
	desc = "A robust beret with the security insignia emblazoned on it. Uses reinforced fabric to offer sufficent protection."
	icon_state = "beret_centcom_captain"
	item_state = ""
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/hat
	name = "black hat"
	desc = "Old western hat."
	icon_state = "blackhat"
	item_state = ""
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/hat/brown
	name = "brown hat"
	desc = "Old western hat."
	icon_state = "brownhat"

/obj/item/clothing/head/kitty/doggy
	name = "doggy ears"
	desc = "A pair of doggy ears! Woof!"
	icon_state = "dog_ears"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/kitty/doggy/equipped(mob/user, slot)
	if(user && slot == slot_head)
		update_icon(user)
	..()

/obj/item/clothing/head/kitty/doggy/update_icon(mob/living/carbon/human/user)
	if(istype(user))
		color = "#[user.hair_color]"

/obj/item/clothing/head/doctor_w_tophat
	name = "tophat"
	icon_state = "doctor_w_tophat"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'

/obj/item/clothing/head/helmet/biker
	name = "Biker's Helmet"
	desc = "This helmet should protect you from russians and masked vigilantes."
	armor = list(melee = 25, bullet = 15, laser = 20, energy = 10, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	icon_state = "biker_helmet"
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/helmet/richard
	name = "Richard"
	desc = "Do you like hurting other people?"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	icon_state = "richard"
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/helmet/doomguy
	name = "Doomguy's helmet"
	desc = "Шлем с маленькими вырезами дл&#255; глаз, в этих чертовых вырезах можно разгл&#255;деть смерть..."
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon_state = "doom"
	icon = 'icons/obj/clothing/infinity_work.dmi'
	flags = HEADBANGPROTECT
	armor = list(melee = 40, bullet = 35, laser = 45,energy = 25, bomb = 40, bio = 5, rad = 0, , fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	strip_delay = 80
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/dad
	name = "mask of the Father"
	desc = "THE LEGEND NEVER DIES."
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	icon_state = "dads_mask"
	item_state = "dads_mask"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	flags = NODROP
	dog_fashion = null

/obj/item/clothing/head/skulltop //but they only for drone >:D
	name = "skulltop"
	desc = "A skulltop, best device for surfing in internet."
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	icon_state = "skulltop"
	item_state = "skulltop"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/helmet/combat_heavy
	name = "Heavy Combat Helmet"
	desc = "A combat helmet made out of goliath hide plates infused with ablative materials in a dark urban camouflage."
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon_state = "swat_pmc"
	item_state = "swat_pmc"
	armor = list(melee = 25, bullet = 50, laser = 50, energy = 45, bomb = 25, bio = 0, rad = 0, fire = 50, acid = 60)
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_TEMP_PROTECT
	flags = HEADBANGPROTECT | HEADCOVERSEYES
	flags_inv = HIDEHAIR
	strip_delay = 60

/obj/item/clothing/head/janitor_cap
	name = "exclusive janitor red cap"
	desc = "Looks like Nanotrasen got so much money to create this pretty red cap!"
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon_state = "janitor_cap"
	item_state = "janitor_cap"

/obj/item/clothing/head/helmet/uac
	name = "trooper helmet"
	desc = "Стандартный шлем десантного отделени&#255; корпорации UAC. Во вс&#255;ком случае, об этом символизирует маленький значок сбоку шлема."
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon_state = "marine_helmet"
	item_state = "marine_helmet"
	flags = HEADBANGPROTECT
	armor = list(melee = 40, bullet = 35, laser = 45,energy = 25, bomb = 40, bio = 5, rad = 0, fire = 20, acid = 50)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	strip_delay = 80
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/cargoberet
	name = "cargoberet"
	desc = "Viva la Cargonia!"
	icon_state = "cargoberet"
	item_state = ""
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'