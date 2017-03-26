/obj/random
	name = "Random Object"
	desc = "This item type is used to spawn random objects at round-start"
	icon = 'icons/misc/mark.dmi'
	icon_state = "rup"
	var/spawn_nothing_percentage = 0

/obj/random/New()
	..()
	if (!prob(spawn_nothing_percentage))
		spawn_item()
	del src

/obj/random/proc/item_to_spawn()
	return 0

/obj/random/proc/spawn_item()
	var/build_path = item_to_spawn()
	return (new build_path(src.loc))


/obj/random/tool
	name = "Random Tool"
	desc = "This is a random tool"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "x"
	color = "#DE9E28"
	item_to_spawn()
		return pick(/obj/item/weapon/screwdriver,\
					/obj/item/weapon/wirecutters,\
					/obj/item/weapon/weldingtool,\
					/obj/item/weapon/crowbar,\
					/obj/item/stack/cable_coil,\
					/obj/item/weapon/wrench)

/obj/random/weaponcrafting
	name = "Random weapon part"
	desc = "This is a random weapon part"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "x"
	spawn_nothing_percentage = 25
	color = "#DB3D3D"
	item_to_spawn()
		return pick(prob(1);/obj/item/weaponcrafting/receiver,\
					prob(2);/obj/item/weaponcrafting/stock,\
					prob(2);/obj/item/stack/packageWrap)


/obj/random/technology_scanner
	name = "Random Scanner"
	desc = "This is a random technology scanner."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "x"
	color = "#3DD3DB"
	spawn_nothing_percentage = 25
	item_to_spawn()
		return pick(/obj/item/device/t_scanner,\
					/obj/item/device/healthanalyzer,\
					/obj/item/device/analyzer)

/obj/random/machine_parts
	name = "Random Parts"
	desc = "This is a random machines parts."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "x"
	color = "#3F6499"
	spawn_nothing_percentage = 20
	item_to_spawn()
		return pick(/obj/item/weapon/stock_parts/capacitor,\
					/obj/item/weapon/stock_parts/console_screen,\
					/obj/item/weapon/stock_parts/manipulator,\
					/obj/item/weapon/stock_parts/matter_bin,\
					/obj/item/weapon/stock_parts/micro_laser,\
					/obj/item/weapon/stock_parts/scanning_module)

/obj/random/bomb_supply
	name = "Bomb Supply"
	desc = "This is a random bomb supply."
	icon = 'icons/obj/infinity_object.dmi'
	color = "#D5DE28"
	icon_state = "x"
	spawn_nothing_percentage = 25
	item_to_spawn()
		return pick(/obj/item/device/assembly/igniter,\
					/obj/item/device/assembly/prox_sensor,\
					/obj/item/device/assembly/signaler
					/obj/item/device/assembly/infra,\
					/obj/item/device/assembly/timer,\
					/obj/item/device/assembly/voice)


/obj/random/toolbox
	name = "Random Toolbox"
	desc = "This is a random toolbox."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "x"
	color = "#3DDB5D"
	item_to_spawn()
		return pick(prob(3);/obj/item/weapon/storage/toolbox/mechanical,\
					prob(2);/obj/item/weapon/storage/toolbox/electrical,\
					prob(1);/obj/item/weapon/storage/toolbox/emergency)


/obj/random/tech_supply
	name = "Random Tech Supply"
	desc = "This is a random piece of technology supplies."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "x"
	color = "#288CDE"
	item_to_spawn()
		return pick(prob(3);/obj/random/technology_scanner,\
					prob(4);/obj/random/bomb_supply,\
					prob(1);/obj/item/weapon/extinguisher/mini,\
					prob(1);/obj/item/clothing/ears/earmuffs,\
					prob(2);/obj/item/device/flashlight,\
					prob(1);/obj/item/device/paicard,\
					prob(5);/obj/random/tool)