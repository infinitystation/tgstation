/datum/crafting_recipe/dragon_cape
	name = "Dragon Cape"
	result = /obj/item/clothing/suit/hooded/dragon_cape
	reqs = list(/obj/item/stack/sheet/bone = 10,
				/obj/item/stack/sheet/sinew = 8,
				/obj/item/stack/sheet/animalhide/ashdrake = 5)
	time = 60
	category = CAT_PRIMAL

/datum/crafting_recipe/eng_un
	name = "Unathi hardsuit"
	result = /obj/item/clothing/suit/space/hardsuit/engine_unathi
	reqs = list(/obj/item/clothing/suit/space/hardsuit/engine = 1)
	tools = list(/obj/item/weapon/wirecutters)
	time = 100
	category = CAT_MISC

/datum/crafting_recipe/un_eng
	name = "Human hardsuit"
	result = /obj/item/clothing/suit/space/hardsuit/engine
	reqs = list(/obj/item/clothing/suit/space/hardsuit/engine_unathi = 1)
	tools = list(/obj/item/weapon/wirecutters)
	time = 100
	category = CAT_MISC

/datum/crafting_recipe/atm_unatm
	name = "atmos unathi hardsuit"
	result = /obj/item/clothing/suit/space/hardsuit/atmos_un
	reqs = list(/obj/item/clothing/suit/space/hardsuit/engine/atmos = 1)
	tools = list(/obj/item/weapon/wirecutters)
	time = 100
	category = CAT_MISC

/datum/crafting_recipe/atm_unatm
	name = "normal atmos hardsuit"
	result = /obj/item/clothing/suit/space/hardsuit/engine/atmos
	reqs = list(/obj/item/clothing/suit/space/hardsuit/atmos_un= 1)
	tools = list(/obj/item/weapon/wirecutters)
	time = 100
	category = CAT_MISC
