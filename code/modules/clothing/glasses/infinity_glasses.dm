/obj/item/clothing/glasses/meson/engine/style
	name = "Engineering Scanner Goggles"
	desc = "Goggles used by engineers. The Meson Scanner mode lets you see basic structural and terrain layouts through walls, regardless of lighting condition. The T-ray Scanner mode lets you see underfloor objects such as cables and pipes."
	icon_state = "stylengi-meson"
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	mode = 1

/obj/item/clothing/glasses/meson/engine/style/update_icon()
	icon_state = mode ? "stylengi-meson" : "stylengi-tray"
	if(istype(loc,/mob/living/carbon/human/))
		var/mob/living/carbon/human/user = loc
		if(user.glasses == src)
			user.update_inv_glasses()

/obj/item/clothing/glasses/meson/engine/style/tray //atmos techs have lived far too long without tray goggles while those damned engineers get their dual-purpose gogles all to themselves
	name = "Optical T-Ray Scanner"
	desc = "Used by engineering staff to see underfloor objects such as cables and pipes."
	icon_state = "stylengi-tray"
	mode = 0

/obj/item/clothing/glasses/godtier //now you live right here
	name = "God Tier Eye's"
	desc = "Holy crap! You really broke those clock!"
	icon = 'icons/obj/clothing/infinity_work.dmi'
	icon_state = "godtier"
	worn_icon = 'icons/mob/infinity_work.dmi'
	flags = NODROP
