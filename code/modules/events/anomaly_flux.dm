/datum/round_event_control/anomaly/anomaly_flux
	name = "Anomaly: Hyper-Energetic Flux"
	typepath = /datum/round_event/anomaly/anomaly_flux
	max_occurrences = 5
	weight = 20

/datum/round_event/anomaly/anomaly_flux
	startWhen = 3
	announceWhen = 20
	endWhen = 80


/datum/round_event/anomaly/anomaly_flux/announce()
	priority_announce("—канеры большого радиуса действия обнаружили волны гипер-энергетического потока. ћесто ожидаемого воздействия: [impact_area.name].", "“ревога! јномалия!")


/datum/round_event/anomaly/anomaly_flux/start()
	var/turf/T = pick(get_area_turfs(impact_area))
	if(T)
		newAnomaly = new /obj/effect/anomaly/flux(T.loc)


/datum/round_event/anomaly/anomaly_flux/end()
	if(newAnomaly.loc)//If it hasn't been neutralized, it's time to blow up.
		explosion(newAnomaly, -1, 3, 5, 5)
		qdel(newAnomaly)