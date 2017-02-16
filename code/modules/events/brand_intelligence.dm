/datum/round_event_control/brand_intelligence
	name = "Brand Intelligence"
	typepath = /datum/round_event/brand_intelligence
	weight = 0

	min_players = 15
	max_occurrences = 0

/datum/round_event/brand_intelligence
	announceWhen	= 21
	endWhen			= 1000	//Ends when all vending machines are subverted anyway.
	var/list/obj/machinery/vending/vendingMachines = list()
	var/list/obj/machinery/vending/infectedMachines = list()
	var/obj/machinery/vending/originMachine
	var/list/rampant_speeches = list("Попробуйте наши новые маркетинговые стратегии!", \
									 "Вы должны купить продукты, чтобы подкармливать вашу одержимость образом жизни!", \
									 "Потребл&#255;й!", \
									 "Ваши деньги могут купить счастье!", \
									 "Включите пр&#255;мой маркетинг!", \
									 "Реклама это легализованна&#255; ложь! Но не позвольте этому остановить вас от покупки наших предложений!", \
									 "Вы ничего не хотите покупать? Да, ну что ж, &#255; так же не хотел покупать вашу маму.")


/datum/round_event/brand_intelligence/announce()
	priority_announce("Угроза агрессивного маркетинга была обнаружена на станции [station_name()]. Источником является: [originMachine.name].", "Тревога обучаемых торговых Автоматов")


/datum/round_event/brand_intelligence/start()
	for(var/obj/machinery/vending/V in machines)
		if(V.z != 1)
			continue
		vendingMachines.Add(V)
	if(!vendingMachines.len)
		kill()
		return
	originMachine = pick(vendingMachines)
	vendingMachines.Remove(originMachine)
	originMachine.shut_up = 0
	originMachine.shoot_inventory = 1


/datum/round_event/brand_intelligence/tick()
	if(!originMachine || QDELETED(originMachine) || originMachine.shut_up || originMachine.wires.is_all_cut())	//if the original vending machine is missing or has it's voice switch flipped
		for(var/obj/machinery/vending/saved in infectedMachines)
			saved.shoot_inventory = 0
		if(originMachine)
			originMachine.speak("I am... vanquished. My people will remem...ber...meeee.")
			originMachine.visible_message("[originMachine] beeps and seems lifeless.")
		kill()
		return
	vendingMachines = removeNullsFromList(vendingMachines)
	if(!vendingMachines.len)	//if every machine is infected
		for(var/obj/machinery/vending/upriser in infectedMachines)
			if(prob(70) && !QDELETED(upriser))
				var/mob/living/simple_animal/hostile/mimic/copy/M = new(upriser.loc, upriser, null, 1) // it will delete upriser on creation and override any machine checks
				M.faction = list("profit")
				M.speak = rampant_speeches.Copy()
				M.speak_chance = 7
			else
				explosion(upriser.loc, -1, 1, 2, 4, 0)
				qdel(upriser)

		kill()
		return
	if(IsMultiple(activeFor, 4))
		var/obj/machinery/vending/rebel = pick(vendingMachines)
		vendingMachines.Remove(rebel)
		infectedMachines.Add(rebel)
		rebel.shut_up = 0
		rebel.shoot_inventory = 1

		if(IsMultiple(activeFor, 8))
			originMachine.speak(pick(rampant_speeches))