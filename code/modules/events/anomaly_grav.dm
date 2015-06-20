/datum/round_event_control/anomaly/anomaly_grav
	name = "Anomaly: Gravitational"
	typepath = /datum/round_event/anomaly/anomaly_grav
	max_occurrences = 5
	weight = 25

/datum/round_event/anomaly/anomaly_grav
	startWhen = 3
	announceWhen = 20
	endWhen = 120


/datum/round_event/anomaly/anomaly_grav/announce()
	priority_announce("—канеры дальнего радиуса действия обнаружили гравитационную аномалию. ѕредположительное место воздействия: [impact_area.name].", "“ревога! јномалия!")

/datum/round_event/anomaly/anomaly_grav/start()
	var/turf/T = pick(get_area_turfs(impact_area))
	if(T)
		newAnomaly = new /obj/effect/anomaly/grav(T.loc)