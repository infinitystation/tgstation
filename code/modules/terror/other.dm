/obj/machinery/mineral/equipment_vendor/terror
	prize_list = list(
		new /datum/data/mining_equipment("Stimpack",			/obj/item/weapon/reagent_containers/hypospray/medipen/stimpack,	    	50),
		new /datum/data/mining_equipment("Stimpack Bundle",		/obj/item/weapon/storage/box/medipens/utility,	 				  		200),
		new /datum/data/mining_equipment("Whiskey",             /obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey,    		100),
		new /datum/data/mining_equipment("Absinthe",            /obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe/premium,100),
		new /datum/data/mining_equipment("Cigar",               /obj/item/clothing/mask/cigarette/cigar/havana,                    		150),
		new /datum/data/mining_equipment("Soap",                /obj/item/weapon/soap/nanotrasen, 						          		200),
		new /datum/data/mining_equipment("Laser Pointer",       /obj/item/device/laser_pointer, 				                   		300),
		new /datum/data/mining_equipment("Alien Toy",           /obj/item/clothing/mask/facehugger/toy, 		                   		300),
		new /datum/data/mining_equipment("Advanced Scanner",	/obj/item/device/t_scanner/adv_mining_scanner,                     		800),
		new /datum/data/mining_equipment("Hivelord Stabilizer",	/obj/item/weapon/hivelordstabilizer			 ,                     		400),
		new /datum/data/mining_equipment("Shelter Capsule",		/obj/item/weapon/survivalcapsule			 ,                     		400),
		new /datum/data/mining_equipment("GAR scanners",		/obj/item/clothing/glasses/meson/gar,					  		   		500),
		new /datum/data/mining_equipment("Explorer Belt",		/obj/item/weapon/storage/belt/mining,									500),
		new /datum/data/mining_equipment("Brute First-Aid Kit",	/obj/item/weapon/storage/firstaid/brute,						   		600),
		new /datum/data/mining_equipment("Jaunter",             /obj/item/device/wormhole_jaunter,                                 		600),
		new /datum/data/mining_equipment("Kinetic Accelerator", /obj/item/weapon/gun/energy/kinetic_accelerator,               	   		750),
		new /datum/data/mining_equipment("Resonator",           /obj/item/weapon/resonator,                                    	   		800),
		new /datum/data/mining_equipment("Plasma Cutter", 		/obj/item/weapon/gun/energy/plasmacutter,				   		   		950),
		new /datum/data/mining_equipment("Lazarus Injector",    /obj/item/weapon/lazarus_injector,                                		1000),
		new /datum/data/mining_equipment("Silver Pickaxe",		/obj/item/weapon/pickaxe/silver,				                  		1000),
		new /datum/data/mining_equipment("Jetpack Upgrade",		/obj/item/hardsuit_jetpack						,	              		2000),
		new /datum/data/mining_equipment("Space Cash",    		/obj/item/stack/spacecash/c1000,                    			  		2000),
		new /datum/data/mining_equipment("Diamond Pickaxe",		/obj/item/weapon/pickaxe/diamond,				                  		2000),
		new /datum/data/mining_equipment("Super Resonator",     /obj/item/weapon/resonator/upgraded,                              		2500),
		new /datum/data/mining_equipment("Super Accelerator",	/obj/item/weapon/gun/energy/kinetic_accelerator/super,			  		3000),
		new /datum/data/mining_equipment("Point Transfer Card", /obj/item/weapon/card/mining_point_card,               			   		500),
		new /datum/data/mining_equipment("Mining Drone",        /mob/living/simple_animal/hostile/mining_drone,                   		800),
		new /datum/data/mining_equipment("Drone Melee Upgrade", /obj/item/device/mine_bot_ugprade,      			   			   		400),
		new /datum/data/mining_equipment("Drone Health Upgrade",/obj/item/device/mine_bot_ugprade/health,      			   	       		400),
		new /datum/data/mining_equipment("Drone Ranged Upgrade",/obj/item/device/mine_bot_ugprade/cooldown,      			   	   		600),
		new /datum/data/mining_equipment("Drone AI Upgrade",    /obj/item/slimepotion/sentience/mining,	      			   	      		1000),
		new /datum/data/mining_equipment("Survival Pack",  		/obj/item/weapon/storage/box/mining/survival,		   	      			1100),
		new /datum/data/mining_equipment("Premium absent",		/obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe/premium,3000),
		new /datum/data/mining_equipment("Empty Sandbag",		/obj/item/weapon/emptysandbag,											500),
		new /datum/data/mining_equipment("d10 dice",			/obj/item/weapon/dice/d10,												250),
		new /datum/data/mining_equipment("d6 dice",				/obj/item/weapon/dice/d6,												200),
		new /datum/data/mining_equipment("Candle",				/obj/item/candle,														100),
		new /datum/data/mining_equipment("Lantern",				/obj/item/device/flashlight/lantern,									350),
		new /datum/data/mining_equipment("Guitar",				/obj/item/device/instrument/guitar,										800),
		new /datum/data/mining_equipment("Universal Recorde", 	/obj/item/device/taperecorder,											500),
		)


/obj/machinery/vending/eatimat
	name = "\improper Eat-I-Mat"
	desc = "Eat this."
	icon_state = "liberationstation"
	products = list(/obj/item/weapon/reagent_containers/food/snacks/beans = 10,/obj/item/weapon/reagent_containers/food/snacks/burger = 20, /obj/item/weapon/reagent_containers/food/snacks/burrito = 20, /obj/item/weapon/reagent_containers/food/snacks/meatballspaghetti = 10,/obj/item/weapon/reagent_containers/food/snacks/meat/steak = 20,/obj/item/weapon/reagent_containers/food/snacks/boiledspaghetti = 15,/obj/item/weapon/reagent_containers/food/snacks/cracker = 20)
	vend_delay = 20
	product_slogans = "I'm your new cook!"
	product_ads = "Time for dinner!"
	req_access_txt = "0"
	refill_canister = /obj/item/weapon/vending_refill/eatimat

/obj/item/weapon/vending_refill/eatimat
	machine_name = "Eat-I-Mat"
	icon_state = "refill_booze"
	charges = list(50, 0, 0)
	init_charges = list(20, 4, 0)

/obj/machinery/light/small/floor
	icon_state = "floor1"
	base_state = "floor"
	fitting = "floor"
	brightness = 5
	layer = 2
	desc = "A small floor lighting fixture."
	light_type = /obj/item/weapon/light/bulb

/obj/item/device/shadowcloak/ops
	name = "stealth ops cloaker belt"
	icon_state = "assaultbelt"
	item_state = "assault"

/obj/item/weapon/melee/chainofcommand/whip
	name = "whip"
	desc = "Mrrr..."
	icon_state = "chain"
	origin_tech = "combat=1"
	needs_permit = 0
	force = 0
	hitsound = "sound/weapons/punch2.ogg"

/obj/machinery/porta_turret/heavy
	name = "heavy turret"
	req_access = list(101)
	emp_vunerable = 0
	scan_range = 9
	health = 150
	installation = /obj/item/weapon/gun/energy/lasercannon
	always_up = 1
	faction = "neutral"

/obj/structure/chair/comfy/sofa
	name = "comfy sofa"
	desc = "It looks comfy.\n<span class='notice'>Alt-click to rotate it clockwise.</span>"
	icon_state = "comfychair2"
	icon = 'code/Monorail_Maks750rus/monorail_ivent.dmi'

/obj/structure/chair/comfy/sofa/New()
	armrest = image("[icon]", "[icon_state]_armrest")
	armrest.layer = MOB_LAYER + 0.1

	return ..()

/obj/structure/chair/comfy/sofa/post_buckle_mob(mob/living/M)
	if(buckled_mobs.len)
		overlays += armrest
	else
		overlays -= armrest

/obj/structure/chair/comfy/sofa/brown
	color = rgb(255,113,0)

/obj/structure/chair/comfy/sofa/beige
	color = rgb(255,253,195)

/obj/structure/chair/comfy/sofa/teal
	color = rgb(0,255,255)

/obj/structure/chair/comfy/sofa/black
	color = rgb(167,164,153)

/obj/structure/chair/comfy/sofalime
	color = rgb(255,251,0)

/obj/structure/chair/comfy/sofa/corner
	icon_state = "comfychair3"

/obj/structure/chair/comfy/sofa/corner/New()
	armrest = image("[icon]", "[icon_state]_armrest")
	armrest.layer = MOB_LAYER + 0.1

	return ..()

/obj/structure/chair/comfy/post_buckle_mob(mob/living/M)
	if(buckled_mobs.len)
		overlays += armrest
	else
		overlays -= armrest

/obj/structure/chair/comfy/sofa/corner/brown
	color = rgb(255,113,0)

/obj/structure/chair/comfy/sofa/corner/beige
	color = rgb(255,253,195)

/obj/structure/chair/comfy/sofa/corner/teal
	color = rgb(0,255,255)

/obj/structure/chair/comfy/sofa/corner/black
	color = rgb(167,164,153)

/obj/structure/chair/comfy/sofa/corner/lime
	color = rgb(255,251,0)

/obj/structure/chair/comfy/sofa/corner/right
	icon_state = "comfychair1"

/obj/structure/chair/comfy/sofa/corner/right/New()
	armrest = image("[icon]", "[icon_state]_armrest")
	armrest.layer = MOB_LAYER + 0.1

	return ..()

/obj/structure/chair/comfy/sofa/corner/right/post_buckle_mob(mob/living/M)
	if(buckled_mobs.len)
		overlays += armrest
	else
		overlays -= armrest

/obj/structure/chair/comfy/sofa/corner/right/brown
	color = rgb(255,113,0)

/obj/structure/chair/comfy/sofa/corner/right/beige
	color = rgb(255,253,195)

/obj/structure/chair/comfy/sofa/corner/right/teal
	color = rgb(0,255,255)

/obj/structure/chair/comfy/sofa/corner/right/black
	color = rgb(167,164,153)

/obj/structure/chair/comfy/sofa/corner/right/lime
	color = rgb(255,251,0)

/datum/outfit/paratrooper
	name = "UAC Paratrooper"
	ears = /obj/item/device/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/uac
	suit = /obj/item/clothing/suit/armor/uac
	shoes = /obj/item/clothing/shoes/combat/uac
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/trooper
	id = /obj/item/weapon/card/id/silver
	glasses = /obj/item/clothing/glasses/night
	mask = /obj/item/clothing/mask/breath
	belt = /obj/item/ammo_box/magazine/a646
	l_pocket = /obj/item/weapon/tank/internals/emergency_oxygen
	r_pocket = /obj/item/ammo_box/magazine/a646
	r_hand = /obj/item/weapon/gun/projectile/automatic/mg88

/obj/structure/sign/nanotrasen
	name = "Nanotrasen Emblem"
	desc = "Nanotrasen Emblem - a two litters a front of blue background."
	icon_state = "NT"
	icon = 'icons/obj/infinity_decals.dmi'

/obj/structure/sign/directions/dock
	name = "docking port 1"
	desc = "A direction sign, pointing out which way the Docking port 1 is."
	icon_state = "dock_1"
	icon = 'icons/obj/infinity_decals.dmi'

/obj/structure/sign/directions/dock/two
	name = "docking port 2"
	desc = "A direction sign, pointing out which way the Docking port 2 is."
	icon_state = "dock_2"

/obj/structure/sign/directions/dock/three
	name = "docking port 3"
	desc = "A direction sign, pointing out which way the Docking port 3 is."
	icon_state = "dock_3"

/obj/structure/sign/directions/dock/four
	name = "docking port 4"
	desc = "A direction sign, pointing out which way the Docking port 4 is."
	icon_state = "dock_4"

/mob/living/simple_animal/crab/Groffee
	name = "Groffee"
	real_name = "Groffee"
	desc = "It's Groffee, the lava-crab!"
	icon_state = "evilcrab"
	icon_living = "evilcrab"
	icon_dead = "evilcrab_dead"
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	gold_core_spawnable = 0

/obj/item/projectile/temp/Thot
	name = "heat beam"
	temperature = 600

/obj/structure/dresser/metal
	name = "dresser"
	desc = "A nicely-crafted metal dresser. It's filled with lots of undies."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "metal_dresser"

//»√–”ÿ »!//


/obj/item/toy/plushie
	name = "plushie"
	desc = "An adorable, soft, and cuddly plushie."
	icon = 'icons/obj/infinity_toys.dmi'
	var/poof_sound = 'sound/weapons/thudswoosh.ogg'
	attack_verb = list("poofed", "bopped", "whapped","cuddled","fluffed")

/obj/item/toy/plushie/attack(mob/M as mob, mob/user as mob)
	playsound(loc, poof_sound, 20, 1)
	return ..()

/obj/item/toy/plushie/attack_self(mob/user as mob)
	var/cuddle_verb = pick("hugs","cuddles","snugs")
	user.visible_message("<span class='notice'>[user] [cuddle_verb] the [src].</span>")
	playsound(get_turf(src), poof_sound, 50, 1, -1)
	return ..()

/obj/random/plushie
	name = "Random Plushie"
	desc = "This is a random plushie"
	icon = 'icons/obj/infinity_toys.dmi'
	icon_state = "redfox"

/obj/random/plushie/item_to_spawn()
	return pick(subtypesof(/obj/item/toy/plushie)) //exclude the base type.

/obj/item/toy/plushie/corgi
	name = "corgi plushie"
	icon_state = "corgi"

/obj/item/toy/plushie/girly_corgi
	name = "corgi plushie"
	icon_state = "girlycorgi"

/obj/item/toy/plushie/robo_corgi
	name = "borgi plushie"
	icon_state = "robotcorgi"

/obj/item/toy/plushie/octopus
	name = "octopus plushie"
	icon_state = "loveable"

/obj/item/toy/plushie/face_hugger
	name = "facehugger plushie"
	icon_state = "huggable"

/obj/item/toy/plushie/red_fox
	name = "red fox plushie"
	icon_state = "redfox"

/obj/item/toy/plushie/black_fox
	name = "black fox plushie"
	icon_state = "blackfox"

/obj/item/toy/plushie/marble_fox
	name = "marble fox plushie"
	icon_state = "marblefox"

/obj/item/toy/plushie/blue_fox
	name = "blue fox plushie"
	icon_state = "bluefox"

/obj/item/toy/plushie/orange_fox
	name = "orange fox plushie"
	icon_state = "orangefox"

/obj/item/toy/plushie/coffee_fox
	name = "coffee fox plushie"
	icon_state = "coffeefox"

/obj/item/toy/plushie/pink_fox
	name = "pink fox plushie"
	icon_state = "pinkfox"

/obj/item/toy/plushie/purple_fox
	name = "purple fox plushie"
	icon_state = "purplefox"

/obj/item/toy/plushie/crimson_fox
	name = "crimson fox plushie"
	icon_state = "crimsonfox"

/obj/item/toy/plushie/deer
	name = "deer plushie"
	icon_state = "deer"

/obj/item/toy/plushie/black_cat
	name = "black cat plushie"
	icon_state = "blackcat"

/obj/item/toy/plushie/grey_cat
	name = "grey cat plushie"
	icon_state = "greycat"

/obj/item/toy/plushie/white_cat
	name = "white cat plushie"
	icon_state = "whitecat"

/obj/item/toy/plushie/orange_cat
	name = "orange cat plushie"
	icon_state = "orangecat"

/obj/item/toy/plushie/siamese_cat
	name = "siamese cat plushie"
	icon_state = "siamesecat"

/obj/item/toy/plushie/tabby_cat
	name = "tabby cat plushie"
	icon_state = "tabbycat"

/obj/item/toy/plushie/tuxedo_cat
	name = "tuxedo cat plushie"
	icon_state = "tuxedocat"

//»√–”ÿ »- ¿–œ€!//

/obj/item/toy/carpplushie
	name = "space carp plushie"
	desc = "An adorable stuffed toy that resembles a space carp."
	icon = 'icons/obj/infinity_toys.dmi'
	icon_state = "carpplushie"
	attack_verb = list("bitten", "eaten", "fin slapped")
	bitesound = 'sound/weapons/bite.ogg'

/obj/item/toy/carpplushie/attack(mob/M as mob, mob/user as mob)
	playsound(loc, bitesound, 20, 1)
	return ..()

/obj/item/toy/carpplushie/attack_self(mob/user as mob)
	playsound(src.loc, bitesound, 20, 1)
	return ..()


/obj/random/carp_plushie
	name = "Random Carp Plushie"
	desc = "This is a random plushie"
	icon = 'icons/obj/infinity_toys.dmi'
	icon_state = "carpplushie"

/obj/random/carp_plushie/item_to_spawn()
	return pick(typesof(/obj/item/toy/carpplushie))

/obj/item/toy/carpplushie/ice
	icon_state = "icecarp"

/obj/item/toy/carpplushie/silent
	icon_state = "silentcarp"

/obj/item/toy/carpplushie/electric
	icon_state = "electriccarp"

/obj/item/toy/carpplushie/gold
	icon_state = "goldcarp"

/obj/item/toy/carpplushie/toxin
	icon_state = "toxincarp"

/obj/item/toy/carpplushie/dragon
	icon_state = "dragoncarp"

/obj/item/toy/carpplushie/pink
	icon_state = "pinkcarp"

/obj/item/toy/carpplushie/candy
	icon_state = "candycarp"

/obj/item/toy/carpplushie/nebula
	icon_state = "nebulacarp"

/obj/item/toy/carpplushie/void
	icon_state = "voidcarp"

// ËÍ‡ Ash-Walk'ÂÓ‚

/obj/item/weapon/pickaxe/silver/poor
	name = "ancient pickaxe"
	icon_state = "spickaxe"
	item_state = "spickaxe"
	digspeed = 30
	origin_tech = "materials=4"
	desc = "Ancient, but surprisingly high quality and sharp pick... From it emanates darkness..."
	force = 10

/obj/machinery/porta_turret/syndicate/mining
	scan_range = 9
	health = 150
	projectile = /obj/item/projectile/beam/emitter
	eprojectile = /obj/item/projectile/beam/emitter
	shot_sound = 'sound/weapons/marauder.ogg'
	eshot_sound = 'sound/weapons/marauder.ogg'
	base_icon_state = "syndie"
	faction = "neutral"

/obj/item/weapon/storage/box/mining/survival
	name = "survival pack"
	desc = "œÓÏÓÊÂÚ ÔÓÊËÚ¸ Ì‡ ÔÓÎ ÏËÌÛÚ˚ ‰ÓÎ¸¯Â."
	icon_state = "survival_box"
	icon = 'icons/obj/survival_pack.dmi'

/obj/item/weapon/storage/box/mining/survival/New()
	..()
	new /obj/item/weapon/reagent_containers/pill/patch/silver_sulf(src)
	new /obj/item/weapon/reagent_containers/pill/patch/silver_sulf(src)
	new /obj/item/weapon/reagent_containers/pill/patch/silver_sulf(src)
	new /obj/item/weapon/reagent_containers/pill/patch/styptic(src)
	new /obj/item/weapon/reagent_containers/pill/patch/styptic(src)
	new /obj/item/weapon/reagent_containers/pill/patch/styptic(src)
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/weapon/reagent_containers/food/snacks/donkpocket(src)
	new /obj/item/weapon/reagent_containers/food/snacks/donkpocket(src)

/obj/structure/closet/wall
	name = "wall closet"
	icon = 'icons/wall_closet.dmi'
	icon_state = "w_closet"
	icon_door = "w_closet"
	density = 0
	anchored = 1

/obj/item/clothing/glasses/night/shadowling/terror
	name = "crimson eyes"