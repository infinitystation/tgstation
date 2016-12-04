/mob/living/simple_animal/hostile/anabiosis/anabiosis/
	vision_range = 2
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 10, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	faction = list("hostile")
	weather_immunities = list("lava","ash")//вписать бурю
	environment_smash = 1
	minbodytemp = 0
	maxbodytemp = INFINITY
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "strikes"
	status_flags = 0
	a_intent = "harm"
	see_in_dark = 8
	see_invisible = SEE_INVISIBLE_MINIMUM
	mob_size = MOB_SIZE_LARGE

/mob/living/simple_animal/hostile/anabiosis/Aggro()
	..()
	if(vision_range != aggro_vision_range)
		return

/mob/living/simple_animal/hostile/anabiosis/fleener
	name = "Fleener"
	desc = "Wow. It's can fly?"
	icon = 'icons/mob/infinity_anabiosis/mobs.dmi'
	icon_state = "fleener"
	icon_living = "fleener"
	icon_dead = "fleener_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 5
	attacktext = "stings"
	speed = -1
	movement_type = FLYING
	maxHealth = 100
	health = 100
	mouse_opacity = 2
	harm_intent_damage = 0
	aggro_vision_range = 9
	idle_vision_range = 6
	force_threshold = 15
	melee_damage_lower = 20
	melee_damage_upper = 30
	see_in_dark = 6
	anchored = 1
	var/major_attack_cooldown = 60 //poison
	var/major_attack = 0

/mob/living/simple_animal/hostile/anabiosis/fleener/Life()
	..()
	handle_major_attack()

/mob/living/simple_animal/hostile/anabiosis/fleener/proc/handle_major_attack()
	if(major_attack_cooldown <= world.time + major_attack_cooldown*0.25 && !major_attack)
		major_attack++
	if(!major_attack || stat || AIStatus == AI_IDLE)
		return
	//icon_state = pre_attack_icon

/mob/living/simple_animal/hostile/anabiosis/fleener/revive(full_heal = 0, admin_revive = 0)
	if(..())
		anchored = 1
		. = 1

/mob/living/simple_animal/hostile/anabiosis/fleener/death(gibbed)
	anchored = 0
	..(gibbed)

/mob/living/simple_animal/hostile/anabiosis/fleener/Aggro()
	vision_range = aggro_vision_range
	handle_major_attack()

/mob/living/simple_animal/hostile/anabiosis/fleener/OpenFire()
	if(get_dist(src, target) <= 1)
		visible_message("<span class='warning'>The [src.name] has stung [target.name] a sting!</span>")
		major_attack_cooldown = world.time + major_attack_cooldown
		major_attack = 0
