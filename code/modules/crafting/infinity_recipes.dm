/datum/crafting_recipe/dragon_cape
	name = "Dragon Cape"
	result = /obj/item/clothing/suit/hooded/dragon_cape
	reqs = list(/obj/item/stack/sheet/bone = 10,
				/obj/item/stack/sheet/sinew = 8,
				/obj/item/stack/sheet/animalhide/ashdrake = 5)
	time = 60
	category = CAT_PRIMAL

/datum/crafting_recipe/eng_un
	name = "Convert engineer style hardsuit to unathi"
	result = /obj/item/clothing/suit/space/hardsuit/engine_un
	reqs = list(/obj/item/clothing/suit/space/hardsuit/engine = 1,
				/obj/item/stack/rods = 1)
	tools = list(/obj/item/weapon/wirecutters)
	time = 100
	category = CAT_MISC

/datum/crafting_recipe/eng_un_revert
	name = "Convert unathi hardsuit to engineer style"
	result = /obj/item/clothing/suit/space/hardsuit/engine
	reqs = list(/obj/item/clothing/suit/space/hardsuit/engine_un = 1)
	tools = list(/obj/item/weapon/wirecutters)
	time = 100
	category = CAT_MISC

/datum/crafting_recipe/atm_un //I dont know why one recipe give me ability craft ENGINEERING type to atmospheric.
	name = "Convert atmospheric style hardsuit to unathi"
	result = /obj/item/clothing/suit/space/hardsuit/atmos_un
	reqs = list(/obj/item/clothing/suit/space/hardsuit/engine/atmos = 1)
	tools = list(/obj/item/weapon/wirecutters)
	time = 100
	category = CAT_MISC

/datum/crafting_recipe/atm_un_revert
	name = "Convert unathi hardsuit to atmospheric style"
	result = /obj/item/clothing/suit/space/hardsuit/engine/atmos
	reqs = list(/obj/item/clothing/suit/space/hardsuit/atmos_un = 1)
	tools = list(/obj/item/weapon/wirecutters)
	time = 100
	category = CAT_MISC

/datum/crafting_recipe/bonepickaxe
	name = "Bone Pickaxe"
	result = /obj/item/weapon/pickaxe/bone
	time = 40
	reqs = list(/obj/item/stack/sheet/bone = 5,
				 /obj/item/stack/sheet/sinew = 2)
	category = CAT_PRIMAL