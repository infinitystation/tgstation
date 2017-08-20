/obj/item/projectile/hivebotbullet
	damage = 10
	damage_type = BRUTE

/mob/living/simple_animal/hostile/hivebot
	name = "hivebot"
	desc = "A small robot."
	icon = 'icons/mob/infinity_mob.dmi'
	icon_state = "smallbot"
	icon_living = "smallbot"
	icon_dead = "smallbot"
	gender = NEUTER
	health = 20
	maxHealth = 20
	healable = 0
	melee_damage_lower = 3
	melee_damage_upper = 5
	attacktext = "claws"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	projectilesound = 'sound/weapons/gunshot.ogg'
	projectiletype = /obj/item/projectile/hivebotbullet
	faction = list("hivebot")
	check_friendly_fire = 1
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speak_emote = list("states")
	gold_core_spawnable = 1
	del_on_death = 1
	loot = list(/obj/effect/decal/cleanable/robot_debris)

/mob/living/simple_animal/hostile/hivebot/Initialize()
	. = ..()
	deathmessage = "[src] blows apart!"

/mob/living/simple_animal/hostile/hivebot/range
	name = "hivebot"
	desc = "A smallish robot, this one is armed!"
	icon_state = "smallbot"
	icon_living = "smallbot"
	icon_dead = "smallbot"
	melee_damage_lower = 3
	melee_damage_upper = 5
	ranged = 1
	retreat_distance = 5
	minimum_distance = 5

/mob/living/simple_animal/hostile/hivebot/rapid
	icon_state = "smallbot"
	icon_living = "smallbot"
	icon_dead = "smallbot"
	melee_damage_lower = 3
	melee_damage_upper = 5
	ranged = 1
	rapid = 1
	retreat_distance = 5
	minimum_distance = 5

/mob/living/simple_animal/hostile/hivebot/strong
	name = "strong hivebot"
	desc = "A robot, this one is armed and looks tough!"
	icon_state = "bigbot"
	icon_living = "bigbot"
	icon_dead = "bigbot"
	health = 120
	maxHealth = 120
	melee_damage_lower = 8
	melee_damage_upper = 12
	ranged = 1
	speed = 4.5

/mob/living/simple_animal/hostile/hivebot/engineer
	name = "engineer hivebot"
	desc = "A little robot with a tiny welder on its arm."
	icon_state = "engbot"
	health = 30
	maxHealth = 30
	melee_damage_lower = 0
	melee_damage_upper = 0
	ranged = 1
	retreat_distance = 3
	minimum_distance = 3

/mob/living/simple_animal/hostile/hivebot/death(gibbed)
	do_sparks(3, TRUE, src)
	..(1)
