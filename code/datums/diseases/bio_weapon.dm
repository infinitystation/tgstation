/datum/disease/bio_weapon
	name = "Death"
	max_stages = 4
	spread_text = "On contact"
	spread_flags = CONTACT_GENERAL
	cure_text = "Неизвестное биологическое оружие. Молитесь господу и избегайте контакта с зараженными."
	cures = list("holywater")
	cure_chance = 10
	agent = "SBR 'Death'"
	viable_mobtypes = list(/mob/living/carbon/human)
	desc = "Неопознанное инкубатором биологическое оружие - бесконтрольное развитие, гарантированнаЯ мутациЯ, бесповоротнаЯ смерть. Для замедлениЯ процесса разрушениЯ организма, вводите спейсалин."
	disease_flags = CAN_CARRY|CAN_RESIST
	permeability_mod = 1
	severity = BIOHAZARD

/datum/disease/bio_weapon/stage_act()
	..()
	switch(stage)
		if(2)
			affected_mob.bodytemperature += 5
			if(prob(5))
				affected_mob.emote("cough")
			if(prob(1))
				affected_mob << "<span class='danger'>У меня кружится голова... И меня тошнит...</span>"
				affected_mob.adjustToxLoss(3)
				affected_mob.updatehealth()

		if(3)
			affected_mob.bodytemperature += 5
			if(prob(5))
				affected_mob.emote("sneeze")
			if(prob(5))
				affected_mob.emote("cough")
			if(prob(5))
				affected_mob << "<span class='danger'>Я чувствую слабость...!</span>"
				affected_mob.adjustStaminaLoss(30)
			if(prob(1))
				affected_mob.vomit(10)
		if(4)
			affected_mob.bodytemperature += 10
			if(prob(3))
				affected_mob << "<span class='danger'>Боже, за что мне такие муки...</span>"
				affected_mob.emote("whimper")
				affected_mob.adjustToxLoss(5)
				affected_mob.adjustStaminaLoss(20)
				affected_mob.updatehealth()
			if(prob(5))
				affected_mob << "<span class='danger'>У меня кружится голова...</span>"
				affected_mob.adjustToxLoss(3)
				affected_mob.updatehealth()
			if(prob(5))
				affected_mob.emote("cough")
			if(prob(2))
				affected_mob << "<span class='danger'>Я медленно умираю... Я чувствую это..</span>"
				affected_mob.adjustToxLoss(10)
				affected_mob.updatehealth()
			if(prob(1))
				affected_mob.vomit(10)

	return
