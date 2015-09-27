/datum/round_event_control/weightless
	name = "Gravity Systems Failure"
	typepath = /datum/round_event/weightless
	weight = 15
	max_occurrences = 1

/datum/round_event/weightless
	startWhen = 1
	announceWhen = 5

/datum/round_event/weightless/setup()
	announceWhen = rand(0,10)

/datum/round_event/weightless/announce()
	priority_announce("Внимание: нарушение в работе системы искусственной гравитации.")

/datum/round_event/weightless/start()
	for(var/obj/machinery/gravity_generator/main/station/S in world)
		if(S.z==1)
			explosion(S.loc, 0, 0, 2, 2)
			S.set_broken()
