/obj/machinery/light/small/floor
	icon_state = "floor1"
	base_state = "floor"
	fitting = "floor"
	layer = 2
	desc = "A small floor lighting fixture."
	light_type = /obj/item/weapon/light/bulb

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
	desc = "Heavy turret, usually, installed on important sites or attacking ships."
	req_access = list(0)
	emp_vunerable = 0
	scan_range = 15
	obj_integrity = 100
	max_integrity = 100
	installation = /obj/item/weapon/gun/energy/laser
	faction = "neutral"

/obj/machinery/porta_turret/heavy/central_command
	req_access = list(101)
	obj_integrity = 150
	max_integrity = 150
	desc = "Heavy turret, installed on Nanotrasen Central Command station."
	faction = "neutral"
	density = 0

/obj/machinery/porta_turret/heavy/jail
	name = "jail's turret"
	desc = "Heavy turret, installed on Nanotrasen Central Command station."
	req_access = list(101)
	faction = "nanotrasen"
	density = 0

/obj/structure/chair/comfy/sofa
	name = "comfy sofa"
	desc = "It looks comfy.\n<span class='notice'>Alt-click to rotate it clockwise.</span>"
	icon_state = "comfychair2"
	icon = 'code/Monorail_Maks750rus/monorail_ivent.dmi'
	ghost_rotateble = 0

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

/obj/structure/chair/comfy/sofa/lime
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

/obj/item/toy/carpplushie
	name = "space carp plushie"
	desc = "An adorable stuffed toy that resembles a space carp."
	icon = 'icons/obj/toy.dmi'
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

/obj/machinery/porta_turret/syndicate/mining
	scan_range = 12
	obj_integrity = 150
	max_integrity = 150
	mode = TURRET_LETHAL
	lethal_projectile = /obj/item/projectile/beam/laser/heavylaser
	lethal_projectile_sound = 'sound/weapons/marauder.ogg'
	base_icon_state = "syndie"
	faction = "neutral"

/obj/structure/closet/wall
	name = "wall closet"
	icon = 'icons/obj/wall_closet.dmi'
	icon_state = "w_closet"
	icon_door = "w_closet"
	wall_mounted = 1
	large = FALSE
	anchored = 1
	storage_capacity = 20
	mob_storage_capacity = 0
	can_weld_shut = FALSE

/obj/structure/alien_structure
	name = "alien machinery"
	desc = "You don't know what the fuck is that..."
	icon_state = "computer1"
	icon = 'icons/obj/infinity_alien.dmi'

/datum/design/belt_holding
	name = "Belt of Holding"
	desc = "A belt that opens into a localized pocket of Blue Space."
	id = "belt_holding"
	req_tech = list("bluespace" = 3, "materials" = 5)
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 2000, MAT_DIAMOND = 1000, MAT_URANIUM = 150)
	build_path = /obj/item/weapon/storage/belt/holding
	category = list("Bluespace Designs")

/obj/structure/closet/secure_closet/rnd_st
	name = "Secure Content Locker"
	icon_state = "med"
	anchored = 1

/obj/structure/hyper_sleep
	name = "Hypersleeper's chamber"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "body_scanner_0"

/obj/structure/hyper_sleep/cable
	name = "Hypersleeper's cable"
	icon_state = "cryo_rear"

/obj/structure/hyper_sleep/cable/tunnel
	name = "Hypersleeper's tunnel"
	icon_state = "cryo_rear_nocable"

/obj/machinery/door/poddoor/big
	icon = 'icons/obj/doors/1x2blast_hor.dmi'
	icon_state = "closed"
	bound_width = 64
	density = 1
	opacity = 1

/obj/machinery/door/poddoor/big/preopen
	icon_state = "open"
	density = 0
	opacity = 0

/obj/structure/window/shuttle/dark
	name = "dark shuttle window"
	icon = 'icons/obj/e.dmi'
	icon_state = "dark_shuttle_window"
	smooth = SMOOTH_TRUE
	canSmoothWith = null

/proc/is_thrall(var/mob/living/M)
	return istype(M) && M.mind && ticker && ticker.mode

/obj/item/clothing/mask/balaclava/white
	name = "white balaclava"
	desc = "Spooky?"
	icon_state = "white_balaclava"
	item_state = "white_balaclava"
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	actions_types = null
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	resistance_flags = FIRE_PROOF
	flags = BLOCK_GAS_SMOKE_EFFECT

/obj/item/clothing/mask/killer
	name = "killer's mask"
	desc = "„”¬јјј !"
	icon_state = "killer"
	item_state = "killer"
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	resistance_flags = FIRE_PROOF
	flags = BLOCK_GAS_SMOKE_EFFECT

/obj/item/clothing/suit/killer_suit
	name = "killer robes"
	desc = "„Єрна&#255;-чЄрна&#255; роба чЄрного-чЄрного парн&#255; с чЄрно-чЄрной улицы. Ѕез расизма."
	icon_state = "killer_suit"
	item_state = "killer_suit"
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|NECK
	allowed = list(/obj/item/weapon/kitchen/knife,/obj/item/bodypart/head,)
	armor = list(melee = 20, bullet = 10, laser = 25,energy = 30, bomb = 10, bio = 65, rad = 0, fire = 10, acid = 10)

/obj/item/weapon/cultivator/killer
	name = "hook"
	desc = "Ќеобычно острый и блесст&#255;щий на свете крюк..."
	icon = 'icons/obj/infinity_weapons.dmi'
	icon_state = "hook"
	item_state = "hook"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	origin_tech = "engineering=2;biotech=3"
	force = 60
	throwforce = 10
	attack_verb = list("slashed", "sliced", "cut", "clawed", "hooked")
	hitsound = 'sound/weapons/bladeslice.ogg'

/obj/machinery/computer/shuttle/enemy
	name = "enemy shuttle console"
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	circuit = /obj/item/weapon/circuitboard/computer/enemy_shuttle
	shuttleId = "enemy"
	possible_destinations = "enemy_home;enemy_station;enemy_lavaland;enemy_station_space"

	light_color = LIGHT_COLOR_RED

/obj/item/weapon/circuitboard/computer/enemy_shuttle
	name = "Enemy Shuttle Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/enemy

/obj/machinery/computer/shuttle/science
	name = "science shuttle console"
	circuit = /obj/item/weapon/circuitboard/computer/science_shuttle
	shuttleId = "science"
	possible_destinations = "science_home;science_lab;science_space;sciece_arch"

/obj/item/weapon/circuitboard/computer/science_shuttle
	name = "Science Shuttle Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/science

//¬з€л с карбонки умные пули

/obj/item/projectile/bullet/smart
	name = "smart bullet"
	var/faction = "syndicate"
	damage = 25

/obj/item/projectile/bullet/smart/Bump(atom/A, yes)
	if(ismob(A))
		var/mob/M = A
		if(faction in M.faction)
			forceMove(get_turf(A))
			return 0
	..()

/obj/machinery/tiberium //«ар€ »мперии
	name = "Tiberium crystal"
	desc = "Strange green-glowing crystal... <span class='danger'>You feel headache at it.</span>"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "crystal"
	anchored = 1
	density = 1

/obj/machinery/tiberium/process()
	..()
	radiation_pulse(get_turf(src), 2, 4, 8)

/obj/machinery/tiberium/deconstruct(disassembled = FALSE)
	new /obj/item/weapon/ore/tiberium (loc, 2)
	qdel(src)

/obj/structure/fluff/shuttle_AI
	name = "Shuttle's control system"
	desc = "»спользуется для непосредственного удаленного контроля из центра связи ÷ентрального  оммандования. Ќи на что не годен и по слухам, внутри ничего нет. —ерьезно."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "tracker"
	anchored = 1
	density = 1
	obj_integrity = 250
	max_integrity = 250