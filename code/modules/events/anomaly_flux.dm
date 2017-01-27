/datum/round_event_control/anomaly/anomaly_flux
	name = "Anomaly: Hyper-Energetic Flux"
	typepath = /datum/round_event/anomaly/anomaly_flux

	min_players = 15
	max_occurrences = 3
	weight = 20

/datum/round_event/anomaly/anomaly_flux
	startWhen = 3
	announceWhen = 20

/datum/round_event/anomaly/anomaly_flux/announce()
	priority_announce("Сканеры дальнего радиуса действия обнаружили волны гипер-энергетического потока. Место ожидаемого воздействия: [impact_area.name].", "Тревога! Аномалия!")

/datum/round_event/anomaly/anomaly_flux/start()
	var/turf/T = safepick(get_area_turfs(impact_area))
	if(T)
		newAnomaly = new /obj/effect/anomaly/flux(T)
