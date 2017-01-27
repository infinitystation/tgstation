/datum/round_event_control/processor_overload
	name = "Processor Overload"
	typepath = /datum/round_event/processor_overload
	weight = 15
	min_players = 20

/datum/round_event/processor_overload
	announceWhen	= 1

/datum/round_event/processor_overload/announce()
	var/alert = pick(	"Обнаружен экзосферный пузырь. Возможна перегрузка процессора. Свяжитесь со сво*%xp25)`6cq-BZZT", \
						"Обнаружен экзосферный пузырь. Возможна перегрузка проц*1eta;c5;'1vВ¬-BZZZT", \
						"Обнаружен экзосферный пузырь. Возможна пе#MCi46:5.;@63-BZZZZT", \
						"Обнаружен экзосферный пу'Fz\\k55_@-BZZZZZT", \
						"Обнаружен экз:%ВЈ QCbyj^j</.3-BZZZZZZT", \
						"!!hy%;f3l7e,<$^-BZZZZZZZT")

	for(var/mob/living/silicon/ai/A in ai_list)
	//AIs are always aware of processor overload
		A << "<br><span class='warning'><b>[alert]</b></span><br>"

	// Announce most of the time, but leave a little gap so people don't know
	// whether it's, say, a tesla zapping tcomms, or some selective
	// modification of the tcomms bus
	if(prob(80))
		priority_announce(alert)


/datum/round_event/processor_overload/start()
	for(var/obj/machinery/telecomms/T in telecomms_list)
		if(istype(T, /obj/machinery/telecomms/processor))
			var/obj/machinery/telecomms/processor/P = T
			if(prob(10))
				// Damage the surrounding area to indicate that it popped
				explosion(get_turf(P), 0, 0, 2)
				// Only a level 1 explosion actually damages the machine
				// at all
				P.ex_act(1)
			else
				P.emp_act(1)
