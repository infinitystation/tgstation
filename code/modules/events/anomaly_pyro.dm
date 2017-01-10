/datum/round_event_control/anomaly/anomaly_pyro
	name = "Anomaly: Pyroclastic"
	typepath = /datum/round_event/anomaly/anomaly_pyro
	max_occurrences = 3
	weight = 15

/datum/round_event/anomaly/anomaly_pyro
	startWhen = 10
	announceWhen = 3

/datum/round_event/anomaly/anomaly_pyro/announce()
	priority_announce("Сканеры дальнего радиуса действия обнаружили пирокластическую аномалию. Предположительное место воздействия: [impact_area.name].", "Тревога! Аномалия!")

/datum/round_event/anomaly/anomaly_pyro/start()
	var/turf/T = safepick(get_area_turfs(impact_area))
	if(T)
		newAnomaly = new /obj/effect/anomaly/pyro(T)
