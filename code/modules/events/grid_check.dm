/datum/round_event_control/grid_check
	name = "Grid Check"
	typepath = /datum/round_event/grid_check
	weight = 10
	max_occurrences = 3

/datum/round_event/grid_check
	announceWhen	= 1
	startWhen = 1

/datum/round_event/grid_check/announce(fake)
	priority_announce("Нескнкционарованная активность обнаружена в электросети [station_name()]. В качестве предупредительной меры питание станции отключено на неопределенное время.", "Критический сбой в электросети", 'sound/ai/poweroff.ogg')


/datum/round_event/grid_check/start()
	for(var/P in GLOB.apcs_list)
		var/obj/machinery/power/apc/C = P
		if(C.cell && is_station_level(C.z))
			C.energy_fail(rand(30,120))