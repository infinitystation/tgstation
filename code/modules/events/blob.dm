/datum/round_event_control/blob
	name = "Blob"
	typepath = /datum/round_event/blob
	weight = 0
	max_occurrences = 0

	earliest_start = 18000 //30 minutes

	gamemode_blacklist = list("blob") //Just in case a blob survives that long

/datum/round_event/blob
	announceWhen	= 12
	endWhen			= 120
	var/new_rate = 2

/datum/round_event/blob/New(var/strength)
	..()
	if(strength)
		new_rate = strength

/datum/round_event/blob/announce()
	priority_announce("Ќа станции [station_name()] подтверждена биологическая угроза 5-го уровня. ¬сему персоналу необходимо сдержать угрозу.", "“ревога! Ѕиологическая угроза!", 'sound/AI/outbreak5.ogg')


/datum/round_event/blob/start()
	var/turf/T = pick(blobstart)
	if(!T)
		return kill()
	new/obj/effect/blob/core(T, 200, null, new_rate)
