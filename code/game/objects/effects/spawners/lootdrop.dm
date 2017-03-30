/obj/effect/spawner/lootdrop
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "x2"
	color = "#00FF00"
	var/lootcount = 1		//how many items will be spawned
	var/lootdoubles = TRUE	//if the same item can be spawned twice
	var/list/loot			//a list of possible items to spawn e.g. list(/obj/item, /obj/structure, /obj/effect)

/obj/effect/spawner/lootdrop/Initialize(mapload)
	..()

	if(loot && loot.len)
		var/turf/T = get_turf(src)
		while(lootcount && loot.len)
			var/lootspawn = pickweight(loot)
			if(!lootdoubles)
				loot.Remove(lootspawn)

			if(lootspawn)
				new lootspawn(T)
			lootcount--
	qdel(src)

/obj/effect/spawner/lootdrop/armory_contraband
	name = "armory contraband gun spawner"
	lootdoubles = FALSE

	loot = list(
				/obj/item/weapon/gun/ballistic/automatic/pistol = 8,
				/obj/item/weapon/gun/ballistic/shotgun/automatic/combat = 5,
				/obj/item/weapon/gun/ballistic/revolver/mateba,
				/obj/item/weapon/gun/ballistic/automatic/pistol/deagle
				)

/obj/effect/spawner/lootdrop/gambling
	name = "gambling valuables spawner"
	loot = list(
				/obj/item/weapon/gun/ballistic/revolver/russian = 5,
				/obj/item/weapon/storage/box/syndie_kit/throwing_weapons = 1,
				/obj/item/toy/cards/deck/syndicate = 2
				)

/obj/effect/spawner/lootdrop/grille_or_trash
	name = "maint grille or trash spawner"
	loot = list(/obj/structure/grille = 5,
			/obj/item/weapon/cigbutt = 1,
			/obj/item/trash/cheesie = 1,
			/obj/item/trash/candy = 1,
			/obj/item/trash/chips = 1,
			/obj/item/trash/deadmouse = 1,
			/obj/item/trash/pistachios = 1,
			/obj/item/trash/plate = 1,
			/obj/item/trash/popcorn = 1,
			/obj/item/trash/raisins = 1,
			/obj/item/trash/sosjerky = 1,
			/obj/item/trash/syndi_cakes = 1)

/obj/effect/spawner/lootdrop/maintenance
	name = "maintenance loot spawner"

	//How to balance this table
	//-------------------------
	//The total added weight of all the entries should be (roughly) equal to the total number of lootdrops
	//(take in account those that spawn more than one object!)
	//
	//While this is random, probabilities tells us that item distribution will have a tendency to look like
	//the content of the weighted table that created them.
	//The less lootdrops, the less even the distribution.
	//
	//If you want to give items a weight <1 you can multiply all the weights by 10
	//
	//the "" entry will spawn nothing, if you increase this value,
	//ensure that you balance it with more spawn points

	//table data:
	//-----------
	//aft maintenance: 		24 items, 18 spots 2 extra (28/08/2014)
	//asmaint: 				16 items, 11 spots 0 extra (08/08/2014)
	//asmaint2:			 	36 items, 26 spots 2 extra (28/08/2014)
	//fpmaint:				5  items,  4 spots 0 extra (08/08/2014)
	//fpmaint2:				12 items, 11 spots 2 extra (28/08/2014)
	//fsmaint:				0  items,  0 spots 0 extra (08/08/2014)
	//fsmaint2:				40 items, 27 spots 5 extra (28/08/2014)
	//maintcentral:			2  items,  2 spots 0 extra (08/08/2014)
	//port:					5  items,  5 spots 0 extra (08/08/2014)
	loot = list(
				/obj/item/bodybag = 1,
				/obj/item/clothing/glasses/meson = 2,
				/obj/item/clothing/glasses/sunglasses = 1,
				/obj/item/clothing/gloves/color/fyellow = 1,
				/obj/item/clothing/head/hardhat = 1,
				/obj/item/clothing/head/hardhat/red = 1,
				/obj/item/clothing/head/that = 1,
				/obj/item/clothing/head/ushanka = 1,
				/obj/item/clothing/head/welding = 1,
				/obj/item/clothing/mask/gas = 15,
				/obj/item/clothing/suit/hazardvest = 1,
				/obj/item/clothing/under/rank/vice = 1,
				/obj/item/device/assembly/prox_sensor = 4,
				/obj/item/device/assembly/timer = 3,
				/obj/item/device/flashlight = 4,
				/obj/item/device/flashlight/pen = 1,
				/obj/item/device/flashlight/glowstick/random = 4,
				/obj/item/device/multitool = 2,
				/obj/item/device/radio/off = 2,
				/obj/item/device/t_scanner = 5,
				/obj/item/weapon/airlock_painter = 1,
				/obj/item/stack/cable_coil/random = 4,
				/obj/item/stack/cable_coil/random{amount = 5} = 6,
				/obj/item/stack/medical/bruise_pack = 1,
				/obj/item/stack/rods{amount = 10} = 9,
				/obj/item/stack/rods{amount = 23} = 1,
				/obj/item/stack/rods{amount = 50} = 1,
				/obj/item/stack/sheet/cardboard = 2,
				/obj/item/stack/sheet/metal{amount = 20} = 1,
				/obj/item/stack/sheet/mineral/plasma = 1,
				/obj/item/stack/sheet/rglass = 1,
				/obj/item/weapon/book/manual/wiki/engineering_construction = 1,
				/obj/item/weapon/book/manual/wiki/engineering_hacking = 1,
				/obj/item/clothing/head/cone = 1,
				/obj/item/weapon/coin/silver = 1,
				/obj/item/weapon/coin/twoheaded = 1,
				/obj/item/weapon/poster/random_contraband = 1,
				/obj/item/weapon/poster/random_official = 1,
				/obj/item/weapon/crowbar = 1,
				/obj/item/weapon/crowbar/red = 1,
				/obj/item/weapon/extinguisher = 11,
				//obj/item/weapon/gun/ballistic/revolver/russian = 1, //disabled until lootdrop is a proper world proc.
				/obj/item/weapon/hand_labeler = 1,
				/obj/item/weapon/paper/crumpled = 1,
				/obj/item/weapon/pen = 1,
				/obj/item/weapon/reagent_containers/spray/pestspray = 1,
				/obj/item/weapon/reagent_containers/glass/rag = 3,
				/obj/item/weapon/stock_parts/cell = 3,
				/obj/item/weapon/storage/belt/utility = 2,
				/obj/item/weapon/storage/box = 2,
				/obj/item/weapon/storage/box/cups = 1,
				/obj/item/weapon/storage/box/donkpockets = 1,
				/obj/item/weapon/storage/box/lights/mixed = 3,
				/obj/item/weapon/storage/box/hug/medical = 1,
				/obj/item/weapon/storage/fancy/cigarettes/dromedaryco = 1,
				/obj/item/weapon/storage/toolbox/mechanical = 1,
				/obj/item/weapon/screwdriver = 3,
				/obj/item/weapon/tank/internals/emergency_oxygen = 2,
				/obj/item/weapon/vending_refill/cola = 1,
				/obj/item/weapon/weldingtool = 3,
				/obj/item/weapon/wirecutters = 1,
				/obj/item/weapon/wrench = 4,
				/obj/item/weapon/relic = 3,
				/obj/item/weaponcrafting/receiver = 2,
				/obj/item/clothing/head/cone = 2,
				/obj/item/weapon/grenade/smokebomb = 2,
				/obj/item/device/geiger_counter = 3,
				/obj/item/weapon/reagent_containers/food/snacks/grown/citrus/orange = 1,
				/obj/item/device/radio/headset = 1,
				/obj/item/device/assembly/infra = 1,
				/obj/item/device/assembly/igniter = 2,
				/obj/item/device/assembly/signaler = 2,
				/obj/item/device/assembly/mousetrap = 2,
				/obj/item/weapon/reagent_containers/syringe = 2,
				/obj/item/clothing/gloves/color/random = 8,
				/obj/item/clothing/shoes/laceup = 1,
				/obj/item/weapon/storage/secure/briefcase = 3,
				/obj/item/weapon/storage/toolbox/artistic = 2,
				/obj/item/toy/eightball = 1,
				"" = 3
				)

/obj/effect/spawner/lootdrop/crate_spawner
	name = "lootcrate spawner" //USE PROMO CODE "SELLOUT" FOR 20% OFF!
	lootdoubles = FALSE

	loot = list(
				/obj/structure/closet/crate/secure/loot = 20,
				"" = 80
				)

/obj/effect/spawner/lootdrop/trash
	name = "Random Trash"
	desc = "This is a random Trash"
	icon = 'icons/obj/items.dmi'
	icon_state = "latexballon_bursted"
	loot = list(
				/obj/item/bodybag = 1,
				/obj/item/clothing/glasses/sunglasses = 1,
				/obj/item/weapon/shard = 5,
				/obj/item/trash/can = 10,
				/obj/item/trash/deadmouse = 3,
				/obj/item/trash/pistachios = 4,
				/obj/item/trash/raisins = 8,
				/obj/item/trash/semki = 2,
				/obj/item/trash/sosjerky = 14,
				/obj/item/trash/candy = 25,
				/obj/item/weapon/storage/fancy/cigarettes = 2,
				/obj/item/stack/rods = 4,
				/obj/item/stack/sheet/cardboard =7,
				/obj/item/stack/packageWrap = 4,
				/obj/item/weapon/c_tube = 3,
				/obj/item/weapon/coin = 12,
				/obj/item/weapon/paper = 29,
				"" = 8
				)

/obj/effect/spawner/lootdrop/fall
	name = "Random Fall ship parts"
	desc = "This is a random falled ship parts"
	icon = 'icons/obj/items.dmi'
	icon_state = "latexballon_bursted"
	color = "Gray"
	loot = list(
				/obj/item/stack/rods = 4,
				/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/cable_coil/cut = 3,
				/obj/item/weapon/shard = 1,
				/obj/effect/decal/cleanable/robot_debris = 4,
				"" = 6
				)

/obj/effect/spawner/lootdrop/food
	name = "Random Food"
	desc = "This is a Food"
	icon = 'icons/obj/hydroponics/harvest.dmi'
	icon_state = "tea_aspera_leaves"
	loot = list(
				/obj/item/weapon/reagent_containers/food/condiment/flour = 1,
				/obj/item/weapon/reagent_containers/food/condiment/milk = 1,
				/obj/item/weapon/reagent_containers/food/snacks/breadslice/plain = 2,
				/obj/item/weapon/reagent_containers/food/snacks/breadslice/meat = 1,
				/obj/item/weapon/reagent_containers/food/snacks/sandwich = 2,
				/obj/item/weapon/reagent_containers/food/snacks/cheesewedge = 1,
				/obj/item/weapon/reagent_containers/food/snacks/egg = 2,
				/obj/item/weapon/reagent_containers/food/snacks/sausage = 1,
				/obj/item/weapon/reagent_containers/food/drinks/beer = 2,
				/obj/item/weapon/reagent_containers/food/snacks/meat/slab = 1,
				/obj/item/weapon/reagent_containers/food/snacks/meat/rawcutlet = 2,
				/obj/item/weapon/reagent_containers/food/snacks/grown/carrot = 1,
				/obj/item/weapon/reagent_containers/food/snacks/grown/potato =2,
				/obj/item/weapon/reagent_containers/food/snacks/grown/cabbage = 1,
				/obj/item/weapon/reagent_containers/food/snacks/grown/tomato = 1,
				/obj/item/weapon/reagent_containers/food/snacks/grown/citrus/orange = 2,
				/obj/item/weapon/reagent_containers/food/snacks/grown/apple = 2,
				/obj/item/weapon/reagent_containers/food/drinks/drinkingglass = 2,
				/obj/item/weapon/reagent_containers/food/snacks/cookie = 2,
				/obj/item/weapon/reagent_containers/food/snacks/soup/beet = 1,
				/obj/item/weapon/reagent_containers/food/snacks/pizzaslice/vegetable = 1,
				/obj/item/weapon/reagent_containers/food/snacks/pizzaslice/meat = 2,
				/obj/item/weapon/reagent_containers/food/snacks/omelette = 1,
				/obj/item/weapon/reagent_containers/food/snacks/cracker = 1,
				"" = 5
				)

/obj/effect/spawner/lootdrop/flora
	name = "Random Flora"
	desc = "This is a Flora"
	icon = 'icons/obj/flora/ausflora.dmi'
	icon_state = "brflowers_1"
	loot = list(
				/obj/structure/flora/ausbushes = 1,
				/obj/structure/flora/ausbushes/reedbush = 1,
				/obj/structure/flora/ausbushes/leafybush = 1,
				/obj/structure/flora/ausbushes/palebush = 1,
				/obj/structure/flora/ausbushes/stalkybush = 1,
				/obj/structure/flora/ausbushes/grassybush = 1,
				/obj/structure/flora/ausbushes/fernybush = 1,
				/obj/structure/flora/ausbushes/sunnybush = 1,
				/obj/structure/flora/ausbushes/genericbush = 1,
				/obj/structure/flora/ausbushes/pointybush = 1,
				/obj/structure/flora/ausbushes/lavendergrass = 1,
				/obj/structure/flora/ausbushes/ywflowers = 1,
				/obj/structure/flora/ausbushes/brflowers = 1,
				/obj/structure/flora/ausbushes/ppflowers = 1,
				/obj/structure/flora/ausbushes/sparsegrass = 1,
				/obj/structure/flora/ausbushes/fullgrass = 1,
				 "" = 5
				)

/obj/effect/spawner/lootdrop/alien
	name = "Random alien's items"
	desc = "This is a random alien's items. Place it on the alien's base."
	icon = 'icons/mob/alien.dmi'
	icon_state = "weed_extract"
	loot = list(
				/obj/item/stack/sheet/mineral/abductor = 5,
				/obj/item/stack/sheet/lessergem = 2,
				/obj/item/stack/sheet/greatergem = 1,
				/obj/item/stack/sheet/mineral/adamantine = 2,
				/obj/item/stack/sheet/xenochitin = 2,
				/obj/item/weapon/restraints/handcuffs/alien = 1,
				/obj/item/bodybag/bluespace = 1,
				/obj/item/device/assembly/control/massdriver = 1,
				/obj/item/device/assembly/health = 1,
				/obj/item/device/assembly/prox_sensor = 2,
				/obj/item/device/assembly/signaler = 2,
				/obj/item/stack/rods = 3,
				/obj/item/weapon/crowbar/large = 1,
				"" = 6
				)

/obj/effect/spawner/lootdrop/organ_spawner
	name = "organ spawner"
	loot = list(
		/obj/item/organ/heart/gland/bloody = 7,
		/obj/item/organ/heart/gland/bodysnatch = 4,
		/obj/item/organ/heart/gland/egg = 7,
		/obj/item/organ/heart/gland/emp = 3,
		/obj/item/organ/heart/gland/mindshock = 5,
		/obj/item/organ/heart/gland/plasma = 7,
		/obj/item/organ/heart/gland/pop = 5,
		/obj/item/organ/heart/gland/slime = 4,
		/obj/item/organ/heart/gland/spiderman = 5,
		/obj/item/organ/heart/gland/ventcrawling = 1,
		/obj/item/organ/body_egg/alien_embryo = 1,
		/obj/item/organ/hivelord_core = 2)
	lootcount = 3

/obj/effect/spawner/lootdrop/two_percent_xeno_egg_spawner
	name = "2% chance xeno egg spawner"
	loot = list(
		/obj/effect/decal/remains/xeno = 49,
		/obj/effect/spawner/xeno_egg_delivery = 1)

/obj/effect/spawner/lootdrop/costume
	name = "random costume spawner"

/obj/effect/spawner/lootdrop/costume/Initialize()
	loot = list()
	for(var/path in subtypesof(/obj/effect/spawner/bundle/costume))
		loot[path] = TRUE
	..()

// Minor lootdrops follow

/obj/effect/spawner/lootdrop/minor/beret_or_rabbitears
	name = "beret or rabbit ears spawner"
	loot = list(
		/obj/item/clothing/head/beret = 1,
		/obj/item/clothing/head/rabbitears = 1)

/obj/effect/spawner/lootdrop/minor/bowler_or_that
	name = "bowler or top hat spawner"
	loot = list(
		/obj/item/clothing/head/bowler = 1,
		/obj/item/clothing/head/that = 1)

/obj/effect/spawner/lootdrop/minor/kittyears_or_rabbitears
	name = "kitty ears or rabbit ears spawner"
	loot = list(
		/obj/item/clothing/head/kitty = 1,
		/obj/item/clothing/head/rabbitears = 1)

/obj/effect/spawner/lootdrop/minor/pirate_or_bandana
	name = "pirate hat or bandana spawner"
	loot = list(
		/obj/item/clothing/head/pirate = 1,
		/obj/item/clothing/head/bandana = 1)

/obj/effect/spawner/lootdrop/minor/twentyfive_percent_cyborg_mask
	name = "25% cyborg mask spawner"
	loot = list(
		/obj/item/clothing/mask/gas/cyborg = 25,
		"" = 75)
