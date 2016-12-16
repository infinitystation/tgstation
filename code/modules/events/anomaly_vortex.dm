/datum/round_event_control/anomaly/anomaly_vortex
	name = "Anomaly: Vortex"
	typepath = /datum/round_event/anomaly/anomaly_vortex

	min_players = 25
	max_occurrences = 2
	weight = 3

/datum/round_event/anomaly/anomaly_vortex
	startWhen = 10
	announceWhen = 3

/datum/round_event/anomaly/anomaly_vortex/announce()
	priority_announce("—канеры дальнего радиуса действия обнаружили вихревую аномалию высокой интенсивности. ќжидаемое место воздействия: [impact_area.name]", "“ревога! јномалия!")

/datum/round_event/anomaly/anomaly_vortex/start()
	var/turf/T = safepick(get_area_turfs(impact_area))
	if(T)
		newAnomaly = new /obj/effect/anomaly/bhole(T)