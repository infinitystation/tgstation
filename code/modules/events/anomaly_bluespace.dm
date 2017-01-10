/datum/round_event_control/anomaly/anomaly_bluespace
	name = "Anomaly: Bluespace"
	typepath = /datum/round_event/anomaly/anomaly_bluespace
	max_occurrences = 1
	weight = 2

/datum/round_event/anomaly/anomaly_bluespace
	startWhen = 3
	announceWhen = 10


/datum/round_event/anomaly/anomaly_bluespace/announce()
	priority_announce("Сканеры дальнего радиуса действиЯ обнаружили нестабильную BlueSpace аномалию. Предположительное место: [impact_area.name].", "Тревога! Аномалия!")

/datum/round_event/anomaly/anomaly_bluespace/start()
	var/turf/T = safepick(get_area_turfs(impact_area))
	if(T)
		newAnomaly = new /obj/effect/anomaly/bluespace(T)
