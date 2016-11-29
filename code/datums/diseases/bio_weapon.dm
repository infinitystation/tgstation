/datum/disease/bio_weapon
	name = "D-Virus"
	max_stages = 4
	spread_text = "On contact"
	spread_flags = CONTACT_GENERAL
	cure_text = "Ќеизвестное биологическое оружие. »збегайте контакта с зараженными. јнтидот невозможно синтезировать в услови€х малых лабораторий."
	cures = list("holywater")
	cure_chance = 10
	agent = "SBR 'Death'"
	viable_mobtypes = list(/mob/living/carbon/human)
	desc = "Ќеопознанное инкубатором биологическое оружие - бесконтрольное развитие, гарантированная мутация, бесповоротная смерть. ƒля замедления процесса разрушения организма, вводите спейсалин."
	disease_flags = CAN_CARRY|CAN_RESIST
	permeability_mod = 3
	severity = BIOHAZARD

/datum/disease/bio_weapon/stage_act()
	..()
	switch(stage)
		if(2)
			affected_mob.bodytemperature += 5
			if(prob(5))
				affected_mob.emote("cough")
			if(prob(3))
				affected_mob << "<span class='danger'>” меня кружится голова... » меня тошнит...</span>"
				affected_mob.adjustToxLoss(3)
				affected_mob.updatehealth()
			if(prob(1))
				affected_mob.vomit(10)
		if(3)
			affected_mob.bodytemperature += 12
			if(prob(5))
				affected_mob.emote("sneeze")
			if(prob(5))
				affected_mob.emote("cough")
			if(prob(5))
				affected_mob << "<span class='danger'>я чувствую слабость...</span>"
				affected_mob.adjustStaminaLoss(30)
			if(prob(1))
				affected_mob.vomit(10)
		if(4)
			affected_mob.bodytemperature += 15
			if(prob(3))
				affected_mob << "<span class='danger'>Ѕоже, за что мне такие муки...</span>"
				affected_mob.emote("whimper")
				affected_mob.adjustToxLoss(5)
				affected_mob.adjustStaminaLoss(20)
				affected_mob.updatehealth()
			if(prob(5))
				affected_mob << "<span class='danger'>” меня кружится и болит голова...</span>"
				affected_mob.adjustToxLoss(5)
				affected_mob.updatehealth()
			if(prob(5))
				affected_mob.emote("cough")
			if(prob(2))
				affected_mob << "<span class='danger'>я медленно умираю... я чувствую это..</span>"
				affected_mob.adjustToxLoss(10)
				affected_mob.updatehealth()
			if(prob(1))
				affected_mob.adjustStaminaLoss(20)
				affected_mob.vomit(10)

	return
