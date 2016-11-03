/datum/disease/bio_weapon
	name = "Death"
	max_stages = 4
	spread_text = "On contact"
	spread_flags = CONTACT_GENERAL
	cure_text = "Ќеизвестное биологическое оружие. ћолитесь господу и избегайте контакта с зараженными."
	cures = list("holywater")
	cure_chance = 10
	agent = "SBR 'Death'"
	viable_mobtypes = list(/mob/living/carbon/human)
	desc = "Ќеопознанное инкубатором биологическое оружие - бесконтрольное развитие, гарантированна€ мутаци€, бесповоротна€ смерть."
	disease_flags = CAN_CARRY|CAN_RESIST
	permeability_mod = 0.5
	severity = BIOHAZARD

/datum/disease/fluspanish/stage_act()
	..()
	switch(stage)
		if(2)
			affected_mob.bodytemperature += 5
			if(prob(5))
				affected_mob.emote("cough")
			if(prob(1))
				affected_mob << "<span class='danger'>” мен€ кружитс€ голова... » мен€ тошнит...</span>"
				affected_mob.adjustToxLoss(3)
				affected_mob.updatehealth()

		if(3)
			affected_mob.bodytemperature += 5
			if(prob(5))
				affected_mob.emote("sneeze")
			if(prob(5))
				affected_mob.emote("cough")
			if(prob(5))
				affected_mob << "<span class='danger'>я чувствую слабость...!</span>"
				affected_mob.adjustStaminaLoss(30)
			if(prob(1))
				affected_mob.vomit(10)
		if(4)
			affected_mob.bodytemperature += 10
			if(prob(3))
				affected_mob << "<span class='danger'>Ѕоже, за что мне такие муки...</span>"
				affected_mob.emote("whimper")
				affected_mob.adjustToxLoss(5)
				affected_mob.adjustStaminaLoss(20)
				affected_mob.updatehealth()
			if(prob(5))
				affected_mob << "<span class='danger'>” мен€ кружитс€ голова...</span>"
				affected_mob.adjustToxLoss(3)
				affected_mob.updatehealth()
			if(prob(5))
				affected_mob.emote("cough")
			if(prob(2))
				affected_mob << "<span class='danger'>я медленно умираю... я чувствую это..</span>"
				affected_mob.adjustToxLoss(10)
				affected_mob.updatehealth()
			if(prob(1))
				affected_mob.vomit(10)