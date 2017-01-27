/datum/round_event_control/anomaly/anomaly_grav
	name = "Anomaly: Gravitational"
	typepath = /datum/round_event/anomaly/anomaly_grav
	max_occurrences = 4
	weight = 20

/datum/round_event/anomaly/anomaly_grav
	startWhen = 3
	announceWhen = 20

/datum/round_event/anomaly/anomaly_grav/announce()
	priority_announce("Сканеры дальнего радиуса действия обнаружили гравитационную аномалию. Предположительное место воздействия: [impact_area.name].", "Тревога! Аномалия!")

/datum/round_event/anomaly/anomaly_grav/start()
	var/turf/T = safepick(get_area_turfs(impact_area))
	if(T)
		newAnomaly = new /obj/effect/anomaly/grav(T)
