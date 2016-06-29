/obj/structure/mineral_door/wood/pyro
	icon = 'icons/obj/infinity_dexofan.dmi'
	icon_state = "wood"
	mineralType = "wood"
	hardness = 1
	openSound = 'sound/effects/doorcreaky.ogg'
	closeSound = 'sound/effects/doorcreaky.ogg'
	burn_state = FLAMMABLE
	burntime = 30

	Open()
		isSwitchingStates = 1
		playsound(loc, openSound, 100, 1)
		flick("woodopening",src)
		sleep(6)
		density = 0
		opacity = 0
		state = 1
		air_update_turf(1)
		update_icon()
		isSwitchingStates = 0

		if(close_delay != -1)
			spawn(close_delay)
				if(!isSwitchingStates && state == 1)
					Close()

	Close()
		var/turf/T = get_turf(src)
		for(var/mob/living/L in T)
			return
		isSwitchingStates = 1
		playsound(loc, closeSound, 100, 1)
		flick("woodclosing",src)
		sleep(6)
		density = 1
		opacity = 1
		state = 0
		air_update_turf(1)
		update_icon()
		isSwitchingStates = 0

	update_icon()
		if(state)
			icon_state = "woodopen"
		else
			icon_state = mineralType

/obj/structure/mineral_door/wood/pyro/Dismantle(devastated = 0)
	if(!devastated)
		for(var/i = 1, i <= oreAmount, i++)
			new/obj/item/stack/sheet/mineral/wood(get_turf(src))
	qdel(src)