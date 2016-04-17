/proc/PDAs_trigger(sound, message, zlevel=1, no_zlevel=0)
	if(message)
		message = sanitize_a0(message)
	for(var/i in PDAs)
		var/obj/item/device/pda/P = i
		if(!no_zlevel)
			var/turf/T = get_turf(P)
			if(!T)
				continue
			if(T.z == zlevel)
				P.trigger_alert(sound, message)
		else
			P.trigger_alert(sound, message)

/obj/item/device/pda/proc/trigger_alert(sound, message)
	if(!silent)
		if(sound)
			playsound(loc, sound, 75, 1)
		else
			playsound(loc, 'sound/machines/twobeep.ogg', 75, 1)

	if(message)
		//Search for holder of the PDA.
		var/mob/living/L = null
		if(loc && isliving(loc))
			L = loc
		//Maybe they are a pAI!
		else
			L = get(src, /mob/living/silicon)

		if(L && L.stat != UNCONSCIOUS)
			L << "\icon[src] [message]"
		overlays.Cut()
		overlays += image(icon, icon_alert)