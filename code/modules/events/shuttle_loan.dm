#define HIJACK_SYNDIE 1
#define RUSKY_PARTY 2
#define SPIDER_GIFT 3
#define DEPARTMENT_RESUPPLY 4
#define ANTIDOTE_NEEDED 5


/datum/round_event_control/shuttle_loan
	name = "Shuttle loan"
	typepath = /datum/round_event/shuttle_loan
	max_occurrences = 1
	earliest_start = 4000

/datum/round_event/shuttle_loan
	endWhen = 500
	var/dispatch_type = 4
	var/bonus_points = 100
	var/thanks_msg = "В благодарность начислены кое-какие Карго-баллы (шаттл вернётсЯ через 5 минут)."
	var/dispatched = 0
	announceWhen	= 1

/datum/round_event/shuttle_loan/start()
	dispatch_type = pick(HIJACK_SYNDIE, RUSKY_PARTY, SPIDER_GIFT, DEPARTMENT_RESUPPLY, ANTIDOTE_NEEDED)

/datum/round_event/shuttle_loan/announce()
	SSshuttle.shuttle_loan = src
	switch(dispatch_type)
		if(HIJACK_SYNDIE)
			priority_announce("Грузовой отдел: Синдикат пытаетсЯ проникнуть на станцию. Если вы позволите им взломать ваш шаттл, вы добавите нам головной боли.","Контрразведка Центрального КомандованиЯ")
		if(RUSKY_PARTY)
			priority_announce("Грузовой отдел: Группа злых русских хочет устроить вечеринку, могли бы вы послать им ваш Карго Шаттл и сделать так, чтобы они исчезли?","ЦК Программа Помощи Русским")
		if(SPIDER_GIFT)
			priority_announce("Грузовой отдел: Клан Паука послал нам загадочный подарок, можем ли мы переслать его вам, чтобы узнать, что там внутри?","Дипломатический Корпус ЦК")
		if(DEPARTMENT_RESUPPLY)
			priority_announce("Грузовой отдел: КажетсЯ, мы заказали двойную норму пакетов снабжениЯ департаментов в этом месЯце. Мы можем отправить их вам?","Департамент СнабжениЯ ЦК")
			thanks_msg = "Шаттл вернётсЯ через 5 минут."
			bonus_points = 0
		if(ANTIDOTE_NEEDED)
			priority_announce("Грузовой отдел: Ваша станци&#255; была выбрана дл&#255; эпидемиологического эксперимента. Пришлите нам ваш грузовой шаттл, чтобы прин&#255;ть ваши образцы для исследовани&#255;.", "Отдел Исследовательских Инициатив ЦК")

/datum/round_event/shuttle_loan/proc/loan_shuttle()
	priority_announce(thanks_msg, "Грузовой шаттл реквизирован ЦК.")

	dispatched = 1
	SSshuttle.points += bonus_points
	endWhen = activeFor + 1

	SSshuttle.supply.sell()
	SSshuttle.supply.enterTransit()
	if(SSshuttle.supply.z != ZLEVEL_STATION)
		SSshuttle.supply.mode = SHUTTLE_CALL
		SSshuttle.supply.destination = SSshuttle.getDock("supply_home")
	else
		SSshuttle.supply.mode = SHUTTLE_RECALL
	SSshuttle.supply.setTimer(3000)

	switch(dispatch_type)
		if(HIJACK_SYNDIE)
			SSshuttle.centcom_message += "<font color=blue>ПриближаетсЯ команда угонщиков Синдиката.</font>"
		if(RUSKY_PARTY)
			SSshuttle.centcom_message += "<font color=blue>ПриближаютсЯ празднующие русские.</font>"
		if(SPIDER_GIFT)
			SSshuttle.centcom_message += "<font color=blue>ПриближаетсЯ подарок Клана Паука.</font>"
		if(DEPARTMENT_RESUPPLY)
			SSshuttle.centcom_message += "<font color=blue>ПриближаетсЯ снабжение Департамента.</font>"
		if(ANTIDOTE_NEEDED)
			SSshuttle.centcom_message += "<font color=blue>ПриближаютсЯ образцы вирусов</font>"

/datum/round_event/shuttle_loan/tick()
	if(dispatched)
		if(SSshuttle.supply.mode != SHUTTLE_IDLE)
			endWhen = activeFor
		else
			endWhen = activeFor + 1

//whomever coded this didn't even bother to follow the supply ordering code as an example.
//So I had to waste time rewriting it. Thanks for that >:[
/datum/round_event/shuttle_loan/end()
	if(SSshuttle.shuttle_loan && SSshuttle.shuttle_loan.dispatched)
		//make sure the shuttle was dispatched in time
		SSshuttle.shuttle_loan = null

		var/list/empty_shuttle_turfs = list()
		for(var/turf/simulated/floor/T in SSshuttle.supply.areaInstance)
			if(T.density || T.contents.len)	continue
			empty_shuttle_turfs += T
		if(!empty_shuttle_turfs.len)
			return

		var/list/shuttle_spawns = list()
		switch(dispatch_type)
			if(HIJACK_SYNDIE)
				add_crates(list(/datum/supply_packs/emergency/specialops), empty_shuttle_turfs)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/syndicate)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/syndicate)
				if(prob(75))
					shuttle_spawns.Add(/mob/living/simple_animal/hostile/syndicate)
				if(prob(50))
					shuttle_spawns.Add(/mob/living/simple_animal/hostile/syndicate)

			if(RUSKY_PARTY)
				add_crates(list(/datum/supply_packs/organic/party), empty_shuttle_turfs)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/russian)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/russian/ranged)	//drops a mateba
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/bear)
				if(prob(75))
					shuttle_spawns.Add(/mob/living/simple_animal/hostile/russian)
				if(prob(50))
					shuttle_spawns.Add(/mob/living/simple_animal/hostile/bear)

			if(SPIDER_GIFT)
				add_crates(list(/datum/supply_packs/emergency/specialops), empty_shuttle_turfs)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/poison/giant_spider)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/poison/giant_spider)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/poison/giant_spider/nurse)
				if(prob(50))
					shuttle_spawns.Add(/mob/living/simple_animal/hostile/poison/giant_spider/hunter)

				var/turf/T = pick(empty_shuttle_turfs)
				empty_shuttle_turfs.Remove(T)

				new /obj/effect/decal/remains/human(T)
				new /obj/item/clothing/shoes/space_ninja(T)
				new /obj/item/clothing/mask/balaclava(T)

				T = pick(empty_shuttle_turfs)
				new /obj/effect/spider/stickyweb(T)
				T = pick(empty_shuttle_turfs)
				new /obj/effect/spider/stickyweb(T)
				T = pick(empty_shuttle_turfs)
				new /obj/effect/spider/stickyweb(T)
				T = pick(empty_shuttle_turfs)
				new /obj/effect/spider/stickyweb(T)
				T = pick(empty_shuttle_turfs)
				new /obj/effect/spider/stickyweb(T)


			if(ANTIDOTE_NEEDED)
				var/virus_type = pick(/datum/disease/beesease, /datum/disease/brainrot, /datum/disease/fluspanish)
				var/turf/T
				for(var/i=0, i<10, i++)
					if(prob(15))
						shuttle_spawns.Add(/obj/item/weapon/reagent_containers/glass/bottle)
					else if(prob(15))
						shuttle_spawns.Add(/obj/item/weapon/reagent_containers/syringe)
					else if(prob(25))
						shuttle_spawns.Add(/obj/item/weapon/shard)
					T = pick_n_take(empty_shuttle_turfs)
					var/obj/effect/decal/cleanable/blood/b = new(T)
					var/datum/disease/D = new virus_type()
					D.longevity = 1000
					b.viruses += D
					D.holder = b
				shuttle_spawns.Add(/obj/structure/closet/crate)
				shuttle_spawns.Add(/obj/item/weapon/reagent_containers/glass/bottle/pierrot_throat)
				shuttle_spawns.Add(/obj/item/weapon/reagent_containers/glass/bottle/magnitis)

			if(DEPARTMENT_RESUPPLY)
				var/list/crate_types = list(
					/datum/supply_packs/emergency/evac,
					/datum/supply_packs/security/supplies,
					/datum/supply_packs/organic/food,
					/datum/supply_packs/emergency/weedcontrol,
					/datum/supply_packs/engineering/tools,
					/datum/supply_packs/engineering/engiequipment,
					/datum/supply_packs/science/robotics,
					/datum/supply_packs/science/plasma,
					/datum/supply_packs/medical/supplies
					)
				add_crates(crate_types, empty_shuttle_turfs)

				for(var/i=0,i<5,i++)
					var/turf/T = pick(empty_shuttle_turfs)
					var/spawn_type = pick(/obj/effect/decal/cleanable/flour, /obj/effect/decal/cleanable/robot_debris, /obj/effect/decal/cleanable/oil)
					new spawn_type(T)

		var/false_positive = 0
		while(shuttle_spawns.len && empty_shuttle_turfs.len)
			var/turf/T = pick_n_take(empty_shuttle_turfs)
			if(T.contents.len && false_positive < 5)
				false_positive++
				continue

			var/spawn_type = pick_n_take(shuttle_spawns)
			new spawn_type(T)

/datum/round_event/shuttle_loan/proc/add_crates(var/list/crate_types, var/list/turfs)
	for(var/crate_type in crate_types)
		var/turf/T = pick_n_take(turfs)
		var/datum/supply_packs/sp_obj = new crate_type()
		var/atom/Crate = new sp_obj.containertype(T)
		Crate.name = sp_obj.containername
		for(var/type_path in sp_obj.contains)
			var/atom/A = new type_path(Crate)
			if(sp_obj.amount && A.vars.Find("amount") && A:amount)
				A:amount = sp_obj.amount

#undef HIJACK_SYNDIE
#undef RUSKY_PARTY
#undef SPIDER_GIFT
#undef DEPARTMENT_RESUPPLY
#undef ANTIDOTE_NEEDED
