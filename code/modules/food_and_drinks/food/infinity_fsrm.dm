/obj/item/trash/fsrm
	icon = 'icons/obj/food/infinity_fsrm.dmi'

/obj/item/trash/fsrm/sosjerky
	icon_state = "sosjerky_m_t"
	name = "Gunnery Sergeant Hartman's Reserve Jerky"
	desc = "With taste of hellish physical loads and discipline."

/obj/item/trash/fsrm/chocolate
	icon_state = "chocolate_m_t"
	name = "Hershey Chocolate"
	desc = "It withstands high temperatures.Take a break in the killings, eat chocolate."

/obj/item/trash/fsrm/pork
	name = "Lieutenant Rico's canned pork"
	desc = "Tasty nutritious meat in full metal jacket."
	icon_state = "canned_pork_m_t"

/obj/item/weapon/reagent_containers/food/snacks/fsrm
	icon = 'icons/obj/food/infinity_fsrm.dmi'

/obj/item/weapon/reagent_containers/food/snacks/fsrm/sosjerky
	name = "Gunnery Sergeant Hartman's Reserve Jerky"
	desc = "With taste of hellish physical loads and discipline."
	icon_state = "sosjerky_m"
	trash = /obj/item/trash/fsrm/sosjerky
	list_reagents = list("nutriment" = 5, "sugar" = 6)
	junkiness = 25
	filling_color = "#8B0000"

/obj/item/weapon/reagent_containers/food/snacks/fsrm/choclate
	name = "Hershey Chocolate"
	desc = "It withstands high temperatures.Take a break in the killings, eat chocolate."
	icon_state = "chocolate_m"
	trash = /obj/item/trash/fsrm/chocolate
	list_reagents = list("nutriment" = 5, "sugar" = 6)
	junkiness = 25
	filling_color = "#FFD700"

/obj/item/weapon/reagent_containers/food/snacks/fsrm/pork
	name = "Lieutenant Rico's canned pork"
	desc = "Tasty nutritious meat in full metal jacket."
	icon_state = "canned_pork_m"
	trash = /obj/item/trash/fsrm/pork
	list_reagents = list("nutriment" = 10, "sugar" = 5)
	junkiness = 25
	filling_color = "#8B0000"

/datum/reagent/consumable/edrink
	name = "Berserker Energy Drink"
	id = "edrink"
	description = "Taste like pure energy."
	color = "#FFC540"

/datum/reagent/consumable/edrink/on_mob_life(mob/living/M)
	if(prob(3))
		M << "<span style=\"color:#005E00; font-weight: bold;\">You totally don\'t want to die anymore</span>"
	M.AdjustParalysis(-1, 0)
	M.AdjustStunned(-1, 0)
	M.AdjustWeakened(-1, 0)
	M.AdjustSleeping(-2, 0)
	M.adjustStaminaLoss(-5)
	if (M.bodytemperature > 310)//310 is the normal bodytemp. 310.055
		M.bodytemperature = max(310, M.bodytemperature - (5 * TEMPERATURE_DAMAGE_COEFFICIENT))
	..()
	. = 1

/obj/item/weapon/reagent_containers/food/drinks/soda_cans/fsrm_tonic
	name = "Berserker Energy Drink"
	desc = "It fills your body with energy, makes you want to make a forced march with a rifle at the ready."
	icon = 'icons/obj/food/infinity_fsrm.dmi'
	icon_state = "tonic_m"
	list_reagents = list("edrink" = 50)

/obj/item/weapon/reagent_containers/pill/vitamin
	name = "Combat-V multivitamin"
	desc = "Tastes like a crazy mix of something sweet and something acerbic. It's makes you feel yourselves strange"
	icon = 'icons/obj/food/infinity_fsrm.dmi'
	icon_state = "multivitamin"
	list_reagents = list("vitamin" = 30)

/obj/item/weapon/reagent_containers/food/condiment/pack/sugar
	name = "Sugar"
	desc = "Some sugar"
	icon = 'icons/obj/food/infinity_fsrm.dmi'
	icon_state = "condi_sugar"
	list_reagents = list("sugar" = 10)

/obj/item/weapon/storage/box/fsrm
	icon = 'icons/obj/food/infinity_fsrm.dmi'
	icon_state = "milit_meal_0"
	name = "Military ration"
	desc = "Includes canned pork, crackers, energy drink, sugar, chocolate, jerky, multivitamin tablet, also, probably, braveness and brutality."
	var open_state = "0"

/obj/item/weapon/storage/box/fsrm/New()
	..()
	new /obj/item/weapon/reagent_containers/pill/vitamin(src)
	new /obj/item/weapon/reagent_containers/food/drinks/soda_cans/fsrm_tonic(src)
	new /obj/item/weapon/reagent_containers/food/snacks/fsrm/pork(src)
	new /obj/item/weapon/reagent_containers/food/snacks/fsrm/choclate(src)
	new /obj/item/weapon/reagent_containers/food/snacks/fsrm/sosjerky(src)
	new /obj/item/weapon/reagent_containers/food/condiment/pack/sugar(src)

/obj/item/weapon/storage/box/fsrm/update_icon()
	..()
	icon_state = "milit_meal_" + open_state

obj/item/weapon/storage/box/fsrm/remove_from_storage()
	..()
	open_state = "1"
	update_icon()

/obj/machinery/vending/snack
	..()
	premium = list(/obj/item/weapon/storage/box/fsrm = 1)

/obj/item/weapon/vending_refill/snack
	..()
	charges = list(12, 2, 1)
	init_charges = list(12, 2, 1)
