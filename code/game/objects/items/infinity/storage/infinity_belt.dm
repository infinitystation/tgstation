/obj/item/storage/bag/plants/holding //Не спрашивайте, что оно здесь делает.
    name = "plant bag of holding"
    desc = "A plant bag that can hold an infinite amount of plant matter."
    icon = 'icons/obj/hydroponics/infi_equipment.dmi'
    icon_state = "plantbag_bspace"

/obj/item/storage/bag/plants/holding/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_items = INFINITY
	STR.max_combined_w_class = INFINITY

/obj/item/storage/belt/holding
	name = "belt of holding"
	desc = "A belt that opens into a localized pocket of Blue Space. It's been outfitted with anti-malfunction safety measures."
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon_state = "belt_of_holding"
	item_state = "belt_of_holding"
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/belt/holding/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_items = 14
	STR.max_combined_w_class = INFINITY