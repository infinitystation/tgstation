/*
	It's was here for conflict avoiding
	1. bartender's dispenser
	2. bartender's dispenser construction

*/
/obj/machinery/chem_dispenser/bartender
	name = "portable bar dispenser"
	desc = "Ўтука, которая раздает бухло."
	icon = 'icons/obj/BarDispenser.dmi'
	icon_state = "bardispenser"

	energy = 5
	max_energy = 5
	amount = 5
	recharge_delay = 20
	req_access_txt = "25"
	dispensable_reagents = list("gin", "whiskey", "tequilla", "vodka", "vermouth", "rum",
								"wine", "cognac", "kahlua", "beer", "ale", "cream", "orangejuice",
								"tomatojuice", "limejuice", "tonic", "water")

	var/list/special_reagents = list(list("space_up", "lemon_lime", "dry_ramen"),
									 list("gargleblaster", "b52","longislandicedtea"),
									 list("demonsblood","bloodymary","whiterussian","blackrussian"),
									 list("whiskeycola","screwdrivercocktail", "martini", "syndicatebomb",),
									 list("doctorsdelight", "bahama_mama", "silencer", "bilk"),
									 list("manhattan_proj", "singulo", "hooch", "atomicbomb"))
	var/list/temperature_reagents = list(list("tea", "hot_coco", "coffee", "cola", "sodawater"),
										 list("antifreeze", "ice", "sbiten", "spacemountainwind"),
										 list("toxinsspecial", "thirteenloko", "nuka_cola"))
	var/list/hidden_mode_reagents = list("mutetoxin", "beepskysmash", "neurotoxin")

	var/list/default_reagents


	var/seconds_electrified = 0
	var/seconds_unpowered = 0

	var/id_scan = 1
	var/chem_mode_flag = 0
	var/hidden_mode_flag = 0
	var/datum/wires/bardispenser/wires = null //wires update

/obj/machinery/chem_dispenser/bartender/New()
	..()

	wires = new(src) //wires update
	var/obj/item/weapon/circuitboard/chem_dispenser/H = new /obj/item/weapon/circuitboard/chem_dispenser(null)
	H.build_path = /obj/machinery/chem_dispenser/bartender
	H.name = "circuit board (Portable Bar Dispenser)"
	H.req_components = list(
							/obj/item/weapon/stock_parts/matter_bin = 6,
							/obj/item/weapon/stock_parts/capacitor = 2,
							/obj/item/weapon/stock_parts/manipulator = 2,
							/obj/item/weapon/stock_parts/console_screen = 1,
							/obj/item/weapon/stock_parts/cell = 2,
							/obj/item/weapon/stock_parts/micro_laser = 1,
							/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey = 1,)
	component_parts = list()
	component_parts += H
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(null)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(null)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(null)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(null)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(null)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(null)
	component_parts += new /obj/item/weapon/stock_parts/capacitor(null)
	component_parts += new /obj/item/weapon/stock_parts/capacitor(null)
	component_parts += new /obj/item/weapon/stock_parts/console_screen(null)
	component_parts += new /obj/item/weapon/stock_parts/cell/high(null)
	component_parts += new /obj/item/weapon/stock_parts/cell/high(null)
	component_parts += new /obj/item/weapon/stock_parts/micro_laser(null)
	component_parts += new /obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey(null)
	RefreshParts()

/obj/machinery/chem_dispenser/bartender/RefreshParts()
	var/time = 0
	var/temp_energy = 0
	var/i

	//energy
	for(var/obj/item/weapon/stock_parts/matter_bin/M in component_parts)
		temp_energy += M.rating
	max_energy = temp_energy * 5  //max energy = (bin1.rating + bin2.rating - 1) * 5, 5 on lowest 25 on highest

	//recharge delay
	for(var/obj/item/weapon/stock_parts/capacitor/C in component_parts)
		time += C.rating
	for(var/obj/item/weapon/stock_parts/cell/P in component_parts)
		time += round(P.maxcharge, 10000) / 10000
	recharge_delay /= time/2

	//reagents
	for(var/obj/item/weapon/stock_parts/manipulator/M in component_parts)
		for(i=1, i<=M.rating, i++)
			dispensable_reagents = sortList(dispensable_reagents | special_reagents[i])
	for(var/obj/item/weapon/stock_parts/micro_laser/M in component_parts)
		for(i=1, i<=M.rating, i++)
			dispensable_reagents = sortList(dispensable_reagents | temperature_reagents[i])

	default_reagents = sortList(dispensable_reagents)

/obj/machinery/chem_dispenser/bartender/Topic(href, href_list)
	if(href_list["dispense"])
		if((!allowed(usr)) && !emagged && id_scan)	//For SECURE MACHINES YEAH
			usr << "<span class='warning'>Access denied.</span>"	//Unless emagged of course
			return 1
	..()

//wires update
/obj/machinery/chem_dispenser/bartender/attack_hand(mob/user)
	if(seconds_electrified != 0)
		if(shock(user, 100))
			return
	if(panel_open)
		wires.Interact(user)
	..()

//wires update
/obj/machinery/chem_dispenser/bartender/process()
	..()

	if(seconds_electrified > 0)
		seconds_electrified--

/obj/machinery/chem_dispenser/bartender/attackby(var/obj/item/I, var/mob/user)
	..()

	if(default_deconstruction_screwdriver(user, "bardispenser-o", "bardispenser", I))
		return

	if(exchange_parts(user, I))
		return

	else if(istype(I, /obj/item/device/multitool)||istype(I, /obj/item/weapon/wirecutters))
		if(panel_open)
			attack_hand(user)
		return  // wires update

	if(panel_open)
		if(istype(I, /obj/item/weapon/crowbar))
			if(beaker)
				var/obj/item/weapon/reagent_containers/glass/B = beaker
				B.loc = loc
				beaker = null
			default_deconstruction_crowbar(I)
			return 1

	if(src.beaker)
		user << "A [src.beaker] is already loaded into the machine."
		return

	if(istype(I,/obj/item/weapon/reagent_containers/food/drinks/))
		src.beaker =  I
		user.drop_item()
		I.loc = src
		user << "You add the [I] to the machine!"

//wires update
/obj/machinery/chem_dispenser/bartender/proc/shock(mob/user, prb)
	if(stat & (BROKEN|NOPOWER))		// unpowered, no shock
		return 0
	if(!prob(prb))
		return 0
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(5, 1, src)
	s.start()
	if(electrocute_mob(user, get_area(src), src, 0.7))
		return 1
	else
		return 0

// it was here for avoiding conflicts
/obj/item/weapon/circuitboard/chem_dispenser/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/device/multitool))
		if(build_path == /obj/machinery/chem_dispenser/constructable)
			build_path = /obj/machinery/chem_dispenser/bartender
			name = "circuit board (Portable Bar Dispenser)"
			user << "<span class='notice'>You set the board to bartendering.</span>"
			req_components = list(
							/obj/item/weapon/stock_parts/matter_bin = 6,
							/obj/item/weapon/stock_parts/capacitor = 2,
							/obj/item/weapon/stock_parts/manipulator = 2,
							/obj/item/weapon/stock_parts/console_screen = 1,
							/obj/item/weapon/stock_parts/cell = 2,
							/obj/item/weapon/stock_parts/micro_laser = 1,
							/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey = 1)
		else
			build_path =/obj/machinery/chem_dispenser/constructable
			name = "circuit board (Portable Chem Dispenser)"
			user << "<span class='notice'>You set the board to chemistry.</span>"
			req_components = list(
							/obj/item/weapon/stock_parts/matter_bin = 2,
							/obj/item/weapon/stock_parts/capacitor = 1,
							/obj/item/weapon/stock_parts/manipulator = 1,
							/obj/item/weapon/stock_parts/console_screen = 1,
							/obj/item/weapon/stock_parts/cell = 1)