#define DAMAGE 1
#define FIRE 2

/obj/mecha/spacepod
	name = "space pod"
	desc = "A space pod, traditionally used for space travel by those who don't have space gear."
	icon = 'icons/mecha/pods.dmi'
	icon_state = "pod_civ"
	internal_damage_threshold = 50
	step_energy_drain = 1 // It's flying!
	maint_access = 0
	step_in = 3
	layer = 3.9
	health = 500
	bound_width = 64
	bound_height = 64
	damage_absorption = list("brute"=0.9,"fire"=1,"bullet"=0.8,"laser"=0.8,"energy"=1,"bomb"=0.4)
	step_in = 1
	stepsound = null
	turnsound = null
	max_equip = 5
	var/engine = 0
	var/hatch_open = 0
	var/list/pod_overlays
	var/datum/effect/effect/system/ion_trail_follow/iontrail

/obj/mecha/spacepod/New()
	. = ..()
	if(!pod_overlays)
		pod_overlays = new/list(2)
		pod_overlays[DAMAGE] = image(icon, icon_state="pod_damage")
		pod_overlays[FIRE] = image(icon, icon_state="pod_fire")
	bound_width = 64
	bound_height = 64
	src.use_internal_tank = 1
	if(!iontrail)
		iontrail = new
	iontrail.set_up(src)

/obj/mecha/spacepod/proc/update_icons()
	if(!pod_overlays)
		pod_overlays = new/list(2)
		pod_overlays[DAMAGE] = image(icon, icon_state="pod_damage")
		pod_overlays[FIRE] = image(icon, icon_state="pod_fire")

	if(health <= round(initial(health)/2))
		overlays += pod_overlays[DAMAGE]
		if(health <= round(initial(health)/4))
			overlays += pod_overlays[FIRE]
		else
			overlays -= pod_overlays[FIRE]
	else
		overlays -= pod_overlays[DAMAGE]

/obj/mecha/spacepod/verb/toggle_engine()
	set name = "Toggle Engine"
	set category = "Exosuit Interface"
	set src = usr.loc
	set popup_menu = 0

	if(!can_use(usr))
		return

	if(!engine)
		iontrail.start()
		usr << "Engine started"
		engine = 1
	else
		iontrail.stop()
		usr << "Engine stopped"
		engine = 0


/obj/mecha/spacepod/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0)
	var/oldloc = src.loc
	sleep(step_in)
	. = ..()
	if(dir && (oldloc != NewLoc))
		src.loc.Entered(src, oldloc)

/obj/mecha/spacepod/Process_Spacemove(var/movement_dir = 0)
	if(..())
		return 1
	if(engine && use_power(step_energy_drain))
		return 1
	return 0

/obj/mecha/spacepod/relaymove(mob/user, direction)
	var/moveship = 1
	if(engine && use_power(step_energy_drain) && health)
		src.dir = direction
		switch(direction)
			if(1)
				if(inertia_dir == 2)
					inertia_dir = 0
					moveship = 0
			if(2)
				if(inertia_dir == 1)
					inertia_dir = 0
					moveship = 0
			if(4)
				if(inertia_dir == 8)
					inertia_dir = 0
					moveship = 0
			if(8)
				if(inertia_dir == 4)
					inertia_dir = 0
					moveship = 0
		if(moveship)
			Move(get_step(src,direction), direction)
			if(istype(src.loc, /turf/space))
				inertia_dir = direction

/obj/mecha/spacepod/spacepod
	icon_state = "pod_civ"
	desc = "A space pod, traditionally used for space travel by those who don't have space gear. This is the sleek and unexpensive civilian model."
	health = 300

#undef DAMAGE
#undef FIRE